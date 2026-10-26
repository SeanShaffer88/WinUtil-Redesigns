<#
.SYNOPSIS
    Builds per-design WinUtil launch scripts for the WinUtil-Redesigns repo.

.DESCRIPTION
    WinUtil (Chris Titus Tech) is compiled by its own Compile.ps1 from:
    scripts + functions + config/*.json (embedded) + xaml/inputXML.xaml.
    The look of the app comes from config/themes.json: a "shared" set of
    metrics (fonts, sizes, widths, corner radius) plus "Light" and "Dark"
    colour sets of 40 keys each. At startup WinUtil applies the theme named
    by the user's saved preference, falling back to the Windows mode.

    This script builds ONE design like this:
      1. Copy the pinned upstream source tree to a scratch folder.
      2. Write the design's colours into BOTH the Light and Dark slots of
         themes.json (so the design shows whichever mode the PC is in),
         and merge the design's shared-metric overrides.
      3. Run upstream's own Compile.ps1, unmodified.
      4. Stamp a short header comment and save to dist/<slug>/winutil.ps1.
      5. Write the repo-root launcher stub <slug>.ps1.

    Nothing else in the compiled script differs from upstream: same
    functions, same configs, same XAML. Verify that yourself:
      Build the "original" design and diff it against any other design —
      the only changed lines are inside the themes JSON block.

.PARAMETER Design
    Design slug under designs/ (e.g. pro-console), "original", or "All".

.PARAMETER UpstreamDir
    Folder containing the upstream WinUtil source (with Compile.ps1).
    If missing, the pinned upstream commit is downloaded as a zip from
    GitHub and extracted there.

.EXAMPLE
    .\build\Build-Design.ps1 -Design All
    # Builds every design plus the unmodified original.
#>
param (
    [string]$Design = "All",
    [string]$UpstreamDir = ""
)

$ErrorActionPreference = "Stop"
$RepoRoot = Split-Path -Parent $PSScriptRoot
$PinnedCommit = "2f0bdc8fca52e1ebe31a8d98216428061d3f8956"

if (-not $UpstreamDir) { $UpstreamDir = Join-Path $RepoRoot "work\upstream" }

if (-not (Test-Path (Join-Path $UpstreamDir "Compile.ps1"))) {
    Write-Host "Fetching upstream WinUtil @ $PinnedCommit ..."
    $zip = Join-Path $env:TEMP "winutil-$PinnedCommit.zip"
    Invoke-WebRequest -Uri "https://github.com/ChrisTitusTech/winutil/archive/$PinnedCommit.zip" -OutFile $zip
    $tmp = Join-Path $env:TEMP "winutil-$PinnedCommit-extract"
    if (Test-Path $tmp) { Remove-Item $tmp -Recurse -Force }
    Expand-Archive -Path $zip -DestinationPath $tmp
    New-Item -ItemType Directory -Force -Path $UpstreamDir | Out-Null
    Copy-Item -Path (Join-Path $tmp "winutil-$PinnedCommit\*") -Destination $UpstreamDir -Recurse -Force
}

function Build-One {
    param([string]$Slug)

    $scratch = Join-Path $RepoRoot "work\build-$Slug"
    if (Test-Path $scratch) { Remove-Item $scratch -Recurse -Force }
    New-Item -ItemType Directory -Force -Path $scratch | Out-Null
    foreach ($item in @("Compile.ps1", "config", "functions", "scripts", "xaml", "tools")) {
        Copy-Item -Path (Join-Path $UpstreamDir $item) -Destination $scratch -Recurse -Force
    }

    $designName = "Original (unmodified upstream)"
    if ($Slug -ne "original") {
        $design = Get-Content -Raw -Path (Join-Path $RepoRoot "designs\$Slug\design.json") | ConvertFrom-Json
        $designName = $design.name
        $themesPath = Join-Path $scratch "config\themes.json"
        $themes = Get-Content -Raw -Path $themesPath | ConvertFrom-Json
        # Same design palette in both slots: the app picks Light or Dark from
        # the saved preference / Windows mode, and the design must win either way.
        $themes.Light = $design.colors
        $themes.Dark  = $design.colors
        foreach ($prop in $design.shared.PSObject.Properties) {
            $themes.shared.($prop.Name) = $prop.Value
        }
        $themes | ConvertTo-Json -Depth 10 | Set-Content -Path $themesPath -Encoding UTF8
    }

    Push-Location $scratch
    try { & .\Compile.ps1 } finally { Pop-Location }

    $built = Get-Content -Raw -Path (Join-Path $scratch "winutil.ps1")
    $stamp = "<#`r`n  WinUtil-Redesigns design: $designName ($Slug)`r`n  Upstream: ChrisTitusTech/winutil @ $PinnedCommit (MIT)`r`n  Built: $(Get-Date -Format 'yyyy-MM-dd') by build\Build-Design.ps1 — design changes live in the embedded themes only.`r`n#>`r`n"
    $outDir = Join-Path $RepoRoot "dist\$Slug"
    New-Item -ItemType Directory -Force -Path $outDir | Out-Null
    Set-Content -Path (Join-Path $outDir "winutil.ps1") -Value ($stamp + $built) -Encoding UTF8

    $stub = @"
# WinUtil-Redesigns launcher - $designName ($Slug)
# Downloads this design's built WinUtil script to a file and runs it from
# there. Running from a file matters: when WinUtil relaunches itself as
# Administrator, it re-runs its own file - so it re-runs THIS design
# instead of falling back to the official build.
`$WinUtilDesignPath = Join-Path `$env:TEMP "winutil-$Slug.ps1"
Invoke-RestMethod "https://raw.githubusercontent.com/SeanShaffer88/WinUtil-Redesigns/main/dist/$Slug/winutil.ps1" -OutFile `$WinUtilDesignPath
& `$WinUtilDesignPath @args
"@
    Set-Content -Path (Join-Path $RepoRoot "$Slug.ps1") -Value $stub -Encoding UTF8
    Write-Host "Built dist\$Slug\winutil.ps1 ($designName)"
}

if ($Design -eq "All") {
    Build-One -Slug "original"
    Get-ChildItem -Directory -Path (Join-Path $RepoRoot "designs") | ForEach-Object { Build-One -Slug $_.Name }
} else {
    Build-One -Slug $Design
}
