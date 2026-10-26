# Accessible Large

Light, large type, thick borders, big targets — for tired eyes, high scaling and touch.

- **Mockup:** #8 Light & Large — Accessible First — see `docs/winutil-10-mockups.html`
- **Launch:** `irm "https://raw.githubusercontent.com/SeanShaffer88/WinUtil-Redesigns/main/accessible-large.ps1" | iex`
- **Built script:** `dist/accessible-large/winutil.ps1`

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

- Accent (headings / label colour): `#004578`
- Window background: `#FFFFFF`
- Text: `#000000`
- Action buttons: `#FFFFFF` (hover `#EDEDED`, selected `#C7E0F4`)
- Toggle ON: `#005A9E`
- Shared overrides: `FontFamily` = Segoe UI, `FontSize` = 15, `HeaderFontSize` = 19, `AppEntryFontSize` = 15, `AppEntryWidth` = 260, `TabButtonFontSize` = 16, `TabButtonHeight` = 34, `ButtonFontSize` = 14.5, `ButtonHeight` = 32, `ButtonBorderThickness` = 2, `SearchBarHeight` = 32, `SearchBarTextBoxFontSize` = 14, `GroupBorderBackgroundColor` = #FFFFFF
