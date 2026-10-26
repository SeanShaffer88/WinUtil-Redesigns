# Layout designs — the roadmap

The launchable designs in this repo change WinUtil's **theme**: colours,
fonts, sizes, corner radius. WinUtil's theme system (`config/themes.json`
upstream) controls all of that, and nothing else — a theme cannot move a
control, add a pane, or change the order screens are visited.

## How far the themes already go (so the limitation is small)

The themes are deliberately tuned to close most of the *practical* gap
to these specs, using everything the theme system exposes (40 colour
keys + 44 shared metrics per design):

| Spec | What the launch themes already do about it |
|---|---|
| #1 Sidebar | Tab buttons are sized up (148 wide × 34 high, 58-high tab row, 15pt Segoe UI in the Fluent designs) with a strong selected colour, so the top tab row reads and works as a navigation bar — same job, top instead of left. Content margin is widened so pages breathe like Fluent pages. |
| #2 Wizard | The Creator tab already *is* a wizard upstream; the Fluent and Accessible themes enlarge its step title type (24–26pt) and buttons so the step flow reads as the primary path. Step *gating* for the other tabs is the part a theme cannot add. |
| #3 Dashboard | Midnight enlarges the Updates profile buttons and Config buttons (15pt) toward card-action sizing and raises header type; the Updates tab's three cards already exist upstream. Live status *tiles* need new queries — that part stays spec. |
| #4 Search-first | Compact Expert makes the search bar the widest element on screen (340 wide vs the stock 200) with tightened density everywhere else, so search-led use feels like the design intends. |
| #6 Explorer | The explanation pane's *content* already exists — every tweak has a Description shown in tooltips. Fluent themes widen tooltips to 460 (Accessible: 500) from the stock 300, so hovering the "?" shows the full plain-English description instead of a cramped snippet. That is most of the pane's value, delivered inside the current layout. |
| #8 Accessible | Covered almost entirely by theme: 15pt base type, 20-unit checkbox bullets, 40-high tab buttons, 62-high tab row, 44-unit icon buttons, thick borders. Of all the specs, this one loses the least to being theme-only. |
| #9 Matrix / #10 Recipes | Nothing honest can be done by theme — a comparison table and saved setups are new behaviour. These two remain fully spec. |

What is left after that tuning is genuinely structural: a left rail
instead of a top bar, a separate reading pane, forced step order,
home-screen tiles with live state, a preset table, and saved recipes.
Everything visual — colour, type, density, target size, emphasis,
description readability — is already at or near the mockups.

Five of the original ten mockups (see `winutil-10-mockups.md` in this
folder) are **layout** designs. Each one needs the window-layout file
(`xaml/inputXML.xaml` upstream, ~160 KB) reworked. The hard rule for that
work: upstream's functions find controls **by name** (for example
`WPFInstall…`, `WPFTweaks…` checkboxes are generated into named panels at
startup), so a layout redesign must keep every named control and panel
the code expects, or the script fails at runtime on a real PC. That is
why these ship as specs first and launch commands only after a Windows
run has verified them.

| Spec | Design | What the XAML work involves | Status |
|---|---|---|---|
| #1 | Fluent Sidebar (as drawn) | Replace the top TabControl with a left navigation rail + page host, keeping all tab content and names; the Fluent Dark/Light launch designs already carry its colours and metrics | Spec |
| #2 | Guided Setup Wizard | Reorder the existing tabs into a step flow (Safety → Install → Tweaks → Updates → Review) with Back/Continue navigation layered over the same panels; the Win11 Creator tab already uses this pattern upstream | Spec |
| #3 | Dashboard Home | A new home panel reading live state (installed apps, applied tweaks, update profile, restore point) — needs new query functions, not just layout; its colour study ships as the Midnight launch design | Spec |
| #6 | Master–Detail Explorer | Three panes: category tree, item list, and a reading pane fed by the `Description` fields already present in upstream's tweaks/features JSON | Spec |
| #9 | Preset Matrix | A comparison view generated from `config/preset.json` (upstream preset lists) against the tweaks list; the tweaks themselves stay checkboxes underneath | Spec |
| #10 | Recipe Builder | Save/load named selections as JSON in upstream's own preset format, with an ordered run list (restore point pinned first) and export | Spec |

## Order of attack, when these are built

1. **#9 Preset Matrix** — smallest new surface, data already exists, high
   trust payoff (people can finally see what Standard includes).
2. **#6 Master–Detail Explorer** — descriptions already exist in the JSON;
   the pane is presentation only.
3. **#1 Fluent Sidebar** — pure layout move of existing panels.
4. **#2 Wizard** — navigation layered over #1's shell.
5. **#10 Recipes**, then **#3 Dashboard** — both need new behaviour
   (saved state, live queries), not just new arrangement.

Every layout design, when built, gets the same treatment as the theme
designs: its own folder under `designs/`, its own built script under
`dist/`, its own launch command in the README table, and a
diff-verification pass showing exactly what changed versus upstream.
