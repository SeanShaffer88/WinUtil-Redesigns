# Fluent Light

Windows 11 Settings by day — white and light grey, blue accent, rounded corners.

- **Mockup:** #1 Fluent Sidebar / #8 Light & Large (light variant) — see `docs/winutil-10-mockups.html`
- **Launch:** `irm "https://raw.githubusercontent.com/SeanShaffer88/WinUtil-Redesigns/main/fluent-light.ps1" | iex`
- **Built script:** `dist/fluent-light/winutil.ps1`

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

- Accent (headings / label colour): `#0067C0`
- Window background: `#F3F3F3`
- Text: `#1B1B1B`
- Action buttons: `#0067C0` (hover `#1975C5`, selected `#DCECF7`)
- Toggle ON: `#0067C0`
- Shared overrides: `FontFamily` = Segoe UI, `HeaderFontFamily` = Segoe UI, `ButtonFontFamily` = Segoe UI, `FontSize` = 13, `ButtonCornerRadius` = 6, `AppEntryWidth` = 235, `AppEntryFontSize` = 13.5, `AppEntryMargin` = 4, `GroupBorderBackgroundColor` = #FFFFFF, `TabButtonWidth` = 148, `TabButtonHeight` = 34, `TabRowHeightInPixels` = 58, `TabButtonFontSize` = 15, `TabContentMargin` = 10, `ToolTipWidth` = 460, `CheckBoxBulletDecoratorSize` = 16, `ButtonHeight` = 30, `ButtonWidth` = 210, `SearchBarWidth` = 280, `SearchBarHeight` = 30, `IconButtonSize` = 38, `Win11StepTitleFontSize` = 24
