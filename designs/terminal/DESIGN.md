# Terminal

Phosphor green on black, monospace everywhere — the classic CRT terminal.

- **Mockup:** Terminal series (new) — sibling of #7 Pro Console — see `docs/winutil-10-mockups.html`
- **Launch:** `irm "https://raw.githubusercontent.com/SeanShaffer88/WinUtil-Redesigns/main/terminal.ps1" | iex`
- **Built script:** `dist/terminal/winutil.ps1`

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

- Accent (headings / label colour): `#33FF66`
- Window background: `#000000`
- Text: `#9DFFB4`
- Action buttons: `#0A2E16` (hover `#14532D`, selected `#15803D`)
- Toggle ON: `#33FF66`
- Shared overrides: `FontFamily` = Consolas, Monaco, `HeaderFontFamily` = Consolas, Monaco, `ButtonFontFamily` = Consolas, Monaco, `Win11LogFontFamily` = Consolas, Monaco, `FontSize` = 12, `HeaderFontSize` = 17, `AppEntryWidth` = 205, `AppEntryFontSize` = 12.5, `AppEntryMargin` = 2, `TabButtonWidth` = 118, `TabButtonHeight` = 28, `TabRowHeightInPixels` = 50, `ButtonCornerRadius` = 2, `ButtonHeight` = 26, `SearchBarWidth` = 300, `ToolTipWidth` = 420, `CheckboxMouseOverColor` = #33FF66, `CheckBoxBulletDecoratorSize` = 14, `TabContentMargin` = 6, `GroupBorderBackgroundColor` = #020B06, `IconButtonSize` = 34, `ButtonMargin` = 2
