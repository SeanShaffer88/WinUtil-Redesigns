# Layout designs — the roadmap

The launchable designs in this repo change WinUtil's **theme**: colours,
fonts, sizes, corner radius. WinUtil's theme system (`config/themes.json`
upstream) controls all of that, and nothing else — a theme cannot move a
control, add a pane, or change the order screens are visited.

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
