# Pro Console

True black, one red accent, monospace, dense — the expert console.

- **Mockup:** #7 Black & Red Pro Console (built out as a full prototype) — see `docs/winutil-10-mockups.html`
- **Launch:** `irm "https://raw.githubusercontent.com/SeanShaffer88/WinUtil-Redesigns/main/pro-console.ps1" | iex`
- **Built script:** `dist/pro-console/winutil.ps1`

## How this design is applied

WinUtil's look comes from `config/themes.json` in the upstream source: a
"shared" set of metrics (fonts, sizes, tile widths, corner radius) and
"Light"/"Dark" colour sets. This design's colours (in `design.json`) are
written into **both** the Light and Dark slots, and its shared-metric
overrides are merged, before upstream's own `Compile.ps1` builds the
script. Both slots carry the design because WinUtil picks Light or Dark
from your saved preference / Windows mode — the design wins either way.

Nothing else changes: same functions, same app/tweak/feature configs,
same XAML as upstream at the pinned commit. Diff `dist/original/`
against this design's script and the only differences are inside the
embedded themes block (plus the build stamp comment at the top).

## Signature values

- Accent (headings / label colour): `#FF3247`
- Window background: `#0A0A0B`
- Text: `#F2F2F2`
- Action buttons: `#2A0D12` (hover `#6E1420`, selected `#D21F2F`)
- Toggle ON: `#D21F2F`
- Shared overrides: `FontFamily` = Consolas, Monaco, `HeaderFontFamily` = Consolas, Monaco, `ButtonFontFamily` = Consolas, Monaco, `AppEntryWidth` = 240, `ButtonCornerRadius` = 4, `TabButtonWidth` = 118, `GroupBorderBackgroundColor` = #141416
