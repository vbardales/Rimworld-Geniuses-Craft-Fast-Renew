// One-shot post-process: stamp the delivered ModIcon.png, cut out from its near-black
// background, into a free corner of the already-rendered Preview.png (STYLE_RIMWORLD.md,
// "Le ModIcon détouré sur la vitrine", 2026-09-29). Run after _tools/build-preview.cjs, on
// Mod/About/Preview.png as it stands — no illustration or text is touched here.
//
// This mod's title sits top-left (README/STATUS: "Text starts at (50, 54)"), and the badge
// triangle owns the top-right, so the stamp goes bottom-left at +15deg, same side as the
// text block, edge touching edge (margin 0), per the rule.
//
// Flood-fill from the border, not a global colour-distance pass: the icon's own dark
// linework (the mascot's outline, the gear/wrench) can sit at the same near-black distance
// as the background and must stay opaque; only background actually connected to the image
// edge is cut.
const fs = require('fs');
const path = require('path');
const sharp = require(path.join(require('child_process').execSync('npm root -g').toString().trim(), 'sharp'));

const root = path.resolve(__dirname, '..');
const previewPath = path.join(root, 'Mod/About/Preview.png');
// The full-resolution source, not the delivered 128x128 ModIcon.png: the stamp is upscaled to
// 260px+ on the Preview, and resizing a 128px bitmap that far pixelates it. Same mascot, same
// background, just sharp at the size actually used here.
const iconPath = path.join(root, 'Art/ModIcon-source.png');
const qa = path.join(root, 'Art/QA');

(async () => {
  const iconRaw = await sharp(iconPath).ensureAlpha().raw().toBuffer({ resolveWithObject: true });
  const { width: iw, height: ih } = iconRaw.info;
  const iconData = iconRaw.data;
  const bgColor = [iconData[0], iconData[1], iconData[2]];
  const lowT = 40, highT = 90;
  const N = iw * ih;
  const dist = i4 => Math.hypot(iconData[i4] - bgColor[0], iconData[i4 + 1] - bgColor[1], iconData[i4 + 2] - bgColor[2]);

  // Plain border-connected flood-fill is not enough here: this mascot's outline is one
  // continuous near-black network (every shape shares the same stroke colour) that touches the
  // canvas edge at several points (the speed streaks on the left, the sparkle on the right).
  // A BFS seeded at the border therefore reaches the whole outline by walking along it, wherever
  // it sits in the image - measured at 95% of every near-black pixel, including linework deep in
  // the orange body. Colour distance alone cannot tell a background pixel from an outline pixel
  // of the same ink; only their WIDTH differs, so width is what separates them:
  //
  //   1. match[p]   = every near-black-ish pixel (dist <= highT), the raw candidate set.
  //   2. eroded[p]  = match after a square erosion of radius R: a pixel survives only if every
  //      pixel within R in every direction also matches. The background is a wide open field, so
  //      most of it survives; the outline is a stroke a few dozen pixels wide at this resolution,
  //      thinner than 2R, so it disappears from `eroded` almost entirely.
  //   3. Flood-fill `eroded` from the border: this is the true background core, with the outline
  //      already gone from the seed set, so nothing can crawl along it.
  //   4. Dilate that core back out by R, intersected with `match`: restores the background's real
  //      edge (including its feather band) without ever re-admitting the thin stroke, because
  //      dilation only regrows into pixels that were already candidates AND within reach of a
  //      verified core pixel - a stroke with no core of its own contributes no seed to grow from.
  //
  // R = 40 px (on this 1254x1254 source) was picked by testing 8 to 70: below ~30 the outline
  // survives the erosion almost intact (as bad as plain BFS); the excluded area stops shrinking
  // past ~40, which is the point where the erosion has cleared the stroke network without also
  // eating the real, narrower pockets of background between the gear's teeth and the wrench's jaw.
  const R = 40;
  const match = new Uint8Array(N);
  for (let p = 0; p < N; p++) match[p] = dist(p * 4) <= highT ? 1 : 0;

  // Separable min/max filters with a square structuring element. Out-of-canvas is treated as
  // background for erosion (the true image edge is definitionally open) and as foreground for
  // dilation (never grow past the canvas).
  function erode(mask, r) {
    const tmp = new Uint8Array(N);
    for (let y = 0; y < ih; y++) {
      const row = y * iw;
      for (let x = 0; x < iw; x++) {
        let v = 1;
        for (let dx = -r; dx <= r; dx++) { const xx = x + dx; if (xx >= 0 && xx < iw && !mask[row + xx]) { v = 0; break; } }
        tmp[row + x] = v;
      }
    }
    const out = new Uint8Array(N);
    for (let x = 0; x < iw; x++) {
      for (let y = 0; y < ih; y++) {
        let v = 1;
        for (let dy = -r; dy <= r; dy++) { const yy = y + dy; if (yy >= 0 && yy < ih && !tmp[yy * iw + x]) { v = 0; break; } }
        out[y * iw + x] = v;
      }
    }
    return out;
  }
  function dilate(mask, r) {
    const tmp = new Uint8Array(N);
    for (let y = 0; y < ih; y++) {
      const row = y * iw;
      for (let x = 0; x < iw; x++) {
        let v = 0;
        for (let dx = -r; dx <= r; dx++) { const xx = x + dx; if (xx >= 0 && xx < iw && mask[row + xx]) { v = 1; break; } }
        tmp[row + x] = v;
      }
    }
    const out = new Uint8Array(N);
    for (let x = 0; x < iw; x++) {
      for (let y = 0; y < ih; y++) {
        let v = 0;
        for (let dy = -r; dy <= r; dy++) { const yy = y + dy; if (yy >= 0 && yy < ih && tmp[yy * iw + x]) { v = 1; break; } }
        out[y * iw + x] = v;
      }
    }
    return out;
  }

  const eroded = erode(match, R);
  const visited = new Uint8Array(N);
  const queue = [];
  for (let x = 0; x < iw; x++) { queue.push(x); queue.push((ih - 1) * iw + x); }
  for (let y = 0; y < ih; y++) { queue.push(y * iw); queue.push(y * iw + iw - 1); }
  let qi = 0;
  while (qi < queue.length) {
    const p = queue[qi++];
    if (visited[p]) continue;
    visited[p] = 1;
    if (!eroded[p]) continue;
    const x = p % iw, y = (p - x) / iw;
    if (x > 0) queue.push(p - 1);
    if (x < iw - 1) queue.push(p + 1);
    if (y > 0) queue.push(p - iw);
    if (y < ih - 1) queue.push(p + iw);
  }
  const core = new Uint8Array(N);
  for (let p = 0; p < N; p++) core[p] = visited[p] && eroded[p] ? 1 : 0;
  const restored = dilate(core, R);

  const alphaOverride = new Uint8ClampedArray(N).fill(255);
  for (let p = 0; p < N; p++) {
    if (!restored[p] || !match[p]) continue;
    const d = dist(p * 4);
    alphaOverride[p] = d <= lowT ? 0 : Math.round(255 * (d - lowT) / (highT - lowT));
  }
  const cut = Buffer.from(iconData);
  for (let p = 0; p < iw * ih; p++) cut[p * 4 + 3] = Math.min(cut[p * 4 + 3], alphaOverride[p]);
  const cutoutPng = await sharp(cut, { raw: { width: iw, height: ih, channels: 4 } }).png().toBuffer();

  // Bigger, and spilling past the frame: the owner asked for the icon's side and bottom
  // edges to overflow the window, as if it were stepping out of the corner, not just
  // touching it. Overshoot is a fraction of the rotated stamp's own size, not a fixed
  // pixel count, so it scales with stampSize.
  const stampSize = 260, stampRotation = 15, overshoot = 0.22;
  const stamp = await sharp(cutoutPng).resize(stampSize, stampSize).rotate(stampRotation, { background: { r: 0, g: 0, b: 0, alpha: 0 } }).toBuffer();
  const stampMeta = await sharp(stamp).metadata();

  const preview = sharp(previewPath);
  const { width: pw, height: ph } = await preview.metadata();
  // Negative/overflowing offsets: sharp clips the composite to the canvas on its own, which is
  // exactly the wanted effect (the icon's left and bottom edges run off the frame).
  const left = -Math.round(stampMeta.width * overshoot);
  const top = ph - stampMeta.height + Math.round(stampMeta.height * overshoot);
  const withStamp = await preview
    .composite([{ input: stamp, left, top }])
    .png({ compressionLevel: 9, adaptiveFiltering: true })
    .toBuffer();
  await fs.promises.writeFile(previewPath, withStamp);

  await fs.promises.mkdir(qa, { recursive: true });
  await sharp(cutoutPng).png().toFile(path.join(qa, 'modicon-cutout.png'));
  await sharp(withStamp).resize({ width: 268 }).png().toFile(path.join(qa, 'preview-268-stamped.png'));
  console.log(JSON.stringify({ pw, ph, stampWidth: stampMeta.width, stampHeight: stampMeta.height, bytes: withStamp.length }, null, 2));
})().catch(e => { console.error(e); process.exit(1); });
