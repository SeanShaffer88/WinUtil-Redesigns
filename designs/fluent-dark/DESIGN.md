# Fluent Dark

Windows 11 Settings at night — soft surfaces, blue accent, rounded corners.

- **Mockup:** #1 Fluent Sidebar (dark variant; colours and metrics — sidebar layout is spec #1 in docs) — see `docs/winutil-10-mockups.html`
- **Launch:** `irm "https://raw.githubusercontent.com/SeanShaffer88/WinUtil-Redesigns/main/fluent-dark.ps1" | iex`
- **Built script:** `dist/fluent-dark/winutil.ps1`

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

- Accent (headings / label colour): `#4CC2FF`
- Window background: `#202020`
- Text: `#FFFFFF`
- Action buttons: `#0067C0` (hover `#1975C5`, selected `#4CC2FF`)
- Toggle ON: `#4CC2FF`
- Shared overrides: `FontFamily` = Segoe UI, `HeaderFontFamily` = Segoe UI, `ButtonFontFamily` = Segoe UI, `FontSize` = 12.5, `ButtonCornerRadius` = 6, `AppEntryWidth` = 230, `AppEntryMargin` = 4, `GroupBorderBackgroundColor` = #2B2B2B
