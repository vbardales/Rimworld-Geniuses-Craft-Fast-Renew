param(
    [string]$GameData = 'C:\Program Files (x86)\Steam\steamapps\common\RimWorld\Data'
)
$ErrorActionPreference = 'Stop'
$repo = Split-Path $PSScriptRoot -Parent
[xml]$patch = Get-Content -Raw (Join-Path $repo 'Mod/Patches/GeneralLaborSpeed.xml')
[xml]$vanilla = Get-Content -Raw (Join-Path $GameData 'Core/Defs/Stats/Stats_Pawns_WorkRecipes.xml')

function Assert($condition, [string]$message) {
    if (-not $condition) { throw $message }
}

# XML regression harness for the two operations this mod uses. This does not run
# RimWorld's loader, stat cache, or jobs; TESTING.md covers those manual checks.
function Apply-Operation([xml]$document, $operation) {
    switch ([string]$operation.Class) {
        'PatchOperationConditional' {
            $branch = if ($document.SelectSingleNode([string]$operation.xpath)) {
                $operation.match
            } else { $operation.nomatch }
            Assert ($null -ne $branch) 'Missing conditional branch'
            Apply-Operation $document $branch
        }
        'PatchOperationAdd' {
            $targets = $document.SelectNodes([string]$operation.xpath)
            Assert ($targets.Count -gt 0) 'Patch target not found'
            foreach ($target in $targets) {
                foreach ($child in $operation.value.ChildNodes) {
                    $null = $target.AppendChild($document.ImportNode($child, $true))
                }
            }
        }
        default { throw "Unsupported operation: $($operation.Class)" }
    }
}

$statPath = 'Defs/StatDef[defName="GeneralLaborSpeed"]'
Assert ($vanilla.SelectNodes($statPath).Count -eq 1) 'Expected one vanilla stat'
Assert ($vanilla.SelectNodes("$statPath/skillNeedFactors").Count -eq 0) 'Vanilla now has skill factors; review compatibility'
Assert ($patch.SelectNodes('/Patch/Operation').Count -eq 1) 'Expected one patch operation'
foreach ($existing in @($false, $true)) {
    [xml]$document = $vanilla.CloneNode($true)
    if ($existing) {
        $list = $document.CreateElement('skillNeedFactors')
        $list.InnerXml = '<li Class="SkillNeed_BaseBonus"><skill>Artistic</skill><baseValue>1</baseValue><bonusPerLevel>0</bonusPerLevel></li>'
        $originalEntry = $list.FirstChild.OuterXml
        $null = $document.SelectSingleNode($statPath).AppendChild($list)
    }
    Apply-Operation $document $patch.Patch.Operation
    Assert ($document.SelectNodes("$statPath/skillNeedFactors").Count -eq 1) 'Duplicate XML list'
    $entries = $document.SelectNodes("$statPath/skillNeedFactors/li[skill='Crafting']")
    Assert ($entries.Count -eq 1) 'Expected exactly one Crafting entry'
    $entry = $entries[0]
    Assert ($entry.Class -eq 'SkillNeed_BaseBonus') 'Wrong skill-need class'
    $culture = [Globalization.CultureInfo]::InvariantCulture
    $base = [double]::Parse($entry.baseValue, $culture)
    $bonus = [double]::Parse($entry.bonusPerLevel, $culture)
    foreach ($pair in @(@(0,0.30), @(1,0.80), @(2,1.30), @(5,2.80), @(10,5.30), @(15,7.80), @(20,10.30))) {
        Assert ([Math]::Abs(($base + $bonus * $pair[0]) - $pair[1]) -lt 0.000001) "Wrong curve at level $($pair[0])"
    }
    if ($existing) {
        Assert ($document.SelectSingleNode("$statPath/skillNeedFactors/li[skill='Artistic']").OuterXml -eq $originalEntry) 'Existing entry changed'
    }
    Apply-Operation $document $patch.Patch.Operation
    Assert ($document.SelectNodes("$statPath/skillNeedFactors").Count -eq 1) 'Second application duplicated the list'
    Assert ($document.SelectNodes("$statPath/skillNeedFactors/li[skill='Crafting']").Count -eq 2) 'Duplicate-application behavior changed; update scenario 3'
    Write-Output "PASS: existing list=$existing; target, entries, curve, repeated application"
}
Write-Output 'All patch XML regression checks passed. In-game scenarios remain manual.'
