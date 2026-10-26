# Compact Expert

The original dark design, tightened: smaller type, narrower tiles, more on screen at once.

- **Mockup:** #4 Search-First (density study — palette/queue layout is spec #4 in docs) — see `docs/winutil-10-mockups.html`
- **Launch:** `irm "https://raw.githubusercontent.com/SeanShaffer88/WinUtil-Redesigns/main/compact-expert.ps1" | iex`
- **Built script:** `dist/compact-expert/winutil.ps1`

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

- Accent (headings / label colour): `#FFB000`
- Window background: `#232629`
- Text: `#F7F7F7`
- Action buttons: `#263238` (hover `#3B4252`, selected `#B07D00`)
- Toggle ON: `#FFB000`
- Shared overrides: `FontSize` = 11, `AppEntryWidth` = 185, `AppEntryFontSize` = 12, `AppEntryIconSize` = 22, `AppEntryMargin` = 2, `TabButtonWidth` = 92, `TabButtonHeight` = 23, `ButtonWidth` = 170, `ButtonHeight` = 22, `SearchBarWidth` = 260, `ButtonCornerRadius` = 2
