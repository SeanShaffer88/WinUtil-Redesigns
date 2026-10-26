# High Contrast Night

Black, white and yellow — maximum contrast for low vision and bright rooms.

- **Mockup:** Companion to #8 (dark high-contrast variant) — see `docs/winutil-10-mockups.html`
- **Launch:** `irm "https://raw.githubusercontent.com/SeanShaffer88/WinUtil-Redesigns/main/high-contrast.ps1" | iex`
- **Built script:** `dist/high-contrast/winutil.ps1`

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

- Accent (headings / label colour): `#FFEE00`
- Window background: `#000000`
- Text: `#FFFFFF`
- Action buttons: `#1A1A1A` (hover `#3A3A00`, selected `#5C5600`)
- Toggle ON: `#FFEE00`
- Shared overrides: `FontFamily` = Segoe UI, `FontSize` = 13.5, `HeaderFontSize` = 18, `ButtonCornerRadius` = 2, `ButtonBorderThickness` = 2, `AppEntryWidth` = 240, `GroupBorderBackgroundColor` = #0A0A0A
