# Midnight

Deep navy and teal — a calm dark design for long evening sessions.

- **Mockup:** #3 Dashboard Home (colour study — dashboard layout is spec #3 in docs) — see `docs/winutil-10-mockups.html`
- **Launch:** `irm "https://raw.githubusercontent.com/SeanShaffer88/WinUtil-Redesigns/main/midnight.ps1" | iex`
- **Built script:** `dist/midnight/winutil.ps1`

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

- Accent (headings / label colour): `#2DD4BF`
- Window background: `#0B1220`
- Text: `#E6F1FF`
- Action buttons: `#0F2C46` (hover `#17456B`, selected `#0E7490`)
- Toggle ON: `#2DD4BF`
- Shared overrides: `FontFamily` = Segoe UI, `ButtonCornerRadius` = 6, `AppEntryWidth` = 230, `GroupBorderBackgroundColor` = #111A2E
