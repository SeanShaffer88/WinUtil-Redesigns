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

The shared overrides are chosen to close as much of the gap to the
layout mockups as a theme can reach — tab-bar sizing that reads as
navigation, tooltip widths that can carry the real item descriptions,
search-bar prominence, target sizes, and per-tab emphasis. See
`docs/layout-designs.md` for the per-spec accounting of what that covers
and the few things only a layout change can do.

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
- Shared overrides: `FontFamily` = Segoe UI, `FontSize` = 15, `HeaderFontSize` = 19, `AppEntryFontSize` = 15, `AppEntryWidth` = 260, `TabButtonFontSize` = 16, `TabButtonHeight` = 40, `ButtonFontSize` = 14.5, `ButtonHeight` = 32, `ButtonBorderThickness` = 2, `SearchBarHeight` = 36, `SearchBarTextBoxFontSize` = 15, `GroupBorderBackgroundColor` = #FFFFFF, `TabButtonWidth` = 150, `TabRowHeightInPixels` = 62, `TabContentMargin` = 12, `CheckBoxBulletDecoratorSize` = 20, `CheckBoxMargin` = 18,0,0,4, `ToolTipWidth` = 500, `IconButtonSize` = 44, `IconFontSize` = 17, `SettingsIconFontSize` = 22, `SearchBarWidth` = 300, `ButtonWidth` = 230, `ButtonMargin` = 3, `AppEntryBorderThickness` = 2, `Win11StepTitleFontSize` = 26
