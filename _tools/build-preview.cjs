// Render the existing illustration and HTML overlay; no image generation involved.
// Install dependencies with npm install --prefix _tools, then run this file with Node.
const fs = require('node:fs/promises');
const path = require('node:path');
const { pathToFileURL } = require('node:url');
const { chromium } = require('playwright');
const sharp = require('sharp');

const root = path.resolve(__dirname, '..');
const art = path.join(root, 'Art');
const qa = path.join(art, 'QA');
const output = path.join(root, 'Mod/About/Preview.png');

function luminance(rgb) {
  const linear = rgb.map(v => {
    v /= 255;
    return v <= .04045 ? v / 12.92 : ((v + .055) / 1.055) ** 2.4;
  });
  return linear[0] * .2126 + linear[1] * .7152 + linear[2] * .0722;
}
function rgb(hex) { return hex.slice(1).match(/../g).map(v => parseInt(v, 16)); }
function contrast(a, b) { return (Math.max(a, b) + .05) / (Math.min(a, b) + .05); }

async function main() {
  const palette = JSON.parse(await fs.readFile(path.join(art, 'preview-palette.json'), 'utf8'));
  for (const key of ['veil', 'inkPrimary', 'inkSecondary', 'accent', 'badgeInk']) {
    if (!/^#[0-9A-F]{6}$/i.test(palette[key])) throw new Error(`Invalid palette entry: ${key}`);
  }
  const about = await fs.readFile(path.join(root, 'Mod/About/About.xml'), 'utf8');
  const supported = about.match(/<supportedVersions>([\s\S]*?)<\/supportedVersions>/)[1];
  const versions = [...supported.matchAll(/<li>(\d+\.\d+)<\/li>/g)].map(m => m[1]);
  versions.sort((a, b) => {
    const [am, an] = a.split('.').map(Number), [bm, bn] = b.split('.').map(Number);
    return am - bm || an - bn;
  });
  const version = versions.at(-1);
  if (!version) throw new Error('No supported version for the badge');
  await fs.mkdir(qa, { recursive: true });
  const options = { headless: true };
  if (process.env.CHROME_PATH) options.executablePath = process.env.CHROME_PATH;
  else if (process.platform === 'win32') options.channel = 'chrome';
  const browser = await chromium.launch(options);
  try {
    const page = await browser.newPage({ viewport: { width: 896, height: 504 }, deviceScaleFactor: 1 });
    await page.goto(pathToFileURL(path.join(art, 'preview.html')).href);
    await page.evaluate(async ({ palette, version }) => {
      const style = document.documentElement.style;
      for (const [key, value] of Object.entries(palette)) style.setProperty(`--${key}`, value);
      style.setProperty('--veil-rgb', palette.veil.slice(1).match(/../g).map(v => parseInt(v, 16)).join(','));
      document.querySelector('.version').textContent = version;
      await document.fonts.ready;
      const illustration = new Image();
      illustration.src = 'Preview-source.png';
      await illustration.decode();
    }, { palette, version });
    // Ask Chrome which font actually rendered the text, not only the CSS fallback list.
    const cdp = await page.context().newCDPSession(page);
    await cdp.send('DOM.enable');
    await cdp.send('CSS.enable');
    const { root: documentNode } = await cdp.send('DOM.getDocument');
    const fonts = {};
    for (const selector of ['.name', '.suffix', '.tag', '.summary', '.version']) {
      const { nodeId } = await cdp.send('DOM.querySelector', { nodeId: documentNode.nodeId, selector });
      fonts[selector] = (await cdp.send('CSS.getPlatformFontsForNode', { nodeId })).fonts;
      if (!fonts[selector].length || fonts[selector].some(font => !/^Segoe UI(?: Semibold| Bold)?$/.test(font.familyName))) {
        throw new Error(`Segoe UI is unavailable for ${selector}: ${JSON.stringify(fonts[selector])}`);
      }
    }
    const layout = await page.evaluate(() => {
      const result = {};
      for (const selector of ['.name', '.suffix', '.tag', '.summary', '.version', '.rule', 'h1']) {
        const element = document.querySelector(selector);
        const range = document.createRange();
        range.selectNodeContents(element);
        result[selector] = {
          text: element.textContent,
          rects: Array.from(range.getClientRects(), r => ({ x: r.x, y: r.y, width: r.width, height: r.height })),
          fontSize: getComputedStyle(element).fontSize,
          color: getComputedStyle(element).color,
        };
      }
      return result;
    });
    const rendered = await sharp(await page.screenshot()).png({ compressionLevel: 9, adaptiveFiltering: true }).toBuffer();
    if (rendered.length >= 1_000_000) throw new Error(`Preview exceeds 1 MB: ${rendered.length}`);
    await page.addStyleTag({ content: '.text { visibility: hidden; } .version { visibility: hidden; }' });
    const background = await page.screenshot();
    const { data, info } = await sharp(background).removeAlpha().raw().toBuffer({ resolveWithObject: true });
    const contrasts = {};
    for (const [selector, ink] of Object.entries({ '.name': 'inkPrimary', '.suffix': 'inkSecondary', '.tag': 'inkSecondary', '.summary': 'inkPrimary' })) {
      let minimum = Infinity;
      // Sample every background pixel under the text's line rectangles, stronger than four corners.
      for (const r of layout[selector].rects) {
        if (r.x < 0 || r.y < 0 || r.x + r.width > 896 || r.y + r.height > 504) throw new Error(`Clipped text: ${selector}`);
        for (let y = Math.floor(r.y); y < Math.ceil(r.y + r.height); y++) {
          for (let x = Math.floor(r.x); x < Math.ceil(r.x + r.width); x++) {
            const index = (y * info.width + x) * info.channels;
            minimum = Math.min(minimum, contrast(luminance(rgb(palette[ink])), luminance(Array.from(data.subarray(index, index + 3)))));
          }
        }
      }
      contrasts[selector] = minimum;
      if (minimum < 4.5) throw new Error(`Insufficient contrast ${selector}: ${minimum.toFixed(2)}`);
    }
    contrasts.badge = contrast(luminance(rgb(palette.badgeInk)), luminance(rgb(palette.accent)));
    if (contrasts.badge < 4.5) throw new Error(`Insufficient badge contrast: ${contrasts.badge}`);
    await fs.writeFile(output, rendered);
    await fs.writeFile(path.join(qa, 'preview-background.png'), background);
    await sharp(rendered).resize({ width: 268 }).png().toFile(path.join(qa, 'preview-268.png'));
    const report = { generatedAt: new Date().toISOString(), version, width: 896, height: 504, bytes: rendered.length, paletteFile: 'Art/preview-palette.json', fonts, layout, contrasts };
    await fs.writeFile(path.join(qa, 'preview-checks.json'), JSON.stringify(report, null, 2) + '\n');
    console.log(JSON.stringify({ output, bytes: rendered.length, version, contrasts }, null, 2));
  } finally {
    await browser.close();
  }
}
main().catch(error => { console.error(error); process.exitCode = 1; });
