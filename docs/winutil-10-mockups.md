# WinUtil — 10 Alternate UI Designs

Same program, same real content — **Install** (Brave, Chrome, Firefox, Discord, Teams, Telegram…), **Tweaks** (Essential / Advanced / Customize Preferences, Standard–Minimal–Advanced presets), **Config** (Features, Fixes, Legacy Windows Panels), **Updates** (Recommended / Windows Default / Disable Updates) and **Win11 Creator** (Select ISO → Modify Image → Output, with Status Log). Every mockup below re-arranges *that* work in a different way.

> This is the Markdown version of the HTML mockups. The visual styling (colours, spacing, card shapes) is described in words and in text wireframes, because Markdown cannot draw the screens. For the rendered screens, see `winutil-10-mockups.html` in the same folder.

**How the current UI works** (from the supplied screenshots): five top tabs, dark grey-blue theme, dense checkbox columns on Tweaks, app cards in a 3-wide grid on Install, action buttons stacked in side panels, and a status line pinned to the bottom. Its strengths: everything is visible at once and regulars are fast. Its costs: first-timers get no guidance, nothing explains a tweak before you tick it, and Updates/Creator already use cards and a wizard — so the program is quietly three different design languages at once.

## At a glance — which one is for whom

| # | Design | Big idea | Best for | Main trade-off |
|---|--------|----------|----------|----------------|
| 1 | **Fluent Sidebar** | Windows 11 Settings-style left navigation + switches | Most users — feels native | Less on screen at once |
| 2 | **Guided Setup Wizard** | One decision per screen, in a safe order | First-timers, family PCs | Slower for regulars |
| 3 | **Dashboard Home** | Status tiles + preset cards first, details second | Repeat "new PC day" use | Needs a real home screen built |
| 4 | **Search-First / Run Queue** | Type what you want, queue it, run it all | Power users, keyboard | Browsing/discovery is weaker |
| 5 | **App Store Grid** | Install becomes a visual store with a selection tray | Choosing apps visually | Tweaks/Config need a second style |
| 6 | **Master–Detail Explorer** | Tree → list → plain-English explanation pane | Cautious users, learning | Takes the most screen width |
| 7 | **Black & Red Pro Console** | Dense console, live log always visible | Experts, SEAN's house style | Intimidating to beginners |
| 8 | **Light & Large (Accessible)** | Big type, big switches, one column, light theme | Older eyes, high-DPI, touch | Long scrolling lists |
| 9 | **Preset Matrix** | A table showing exactly what each preset includes | Comparing Minimal/Standard/Advanced | Only shines for Tweaks/presets |
| 10 | **Recipe Builder** | Build, save, export and re-run a named setup | Anyone who sets up many PCs | Most new machinery to build |

**My pick if only one ships:** #1 Fluent Sidebar as the shell, with #3's preset cards on its home page and #6's explanation pane for Tweaks. #10 is the standout *feature* hiding in a design — it turns WinUtil from "run it once" into "my saved setup, on every PC."

---

## 1 · Fluent Sidebar — *Recommended shell*

- **Idea:** Copy the layout every Windows 11 user already knows — Settings. Sections live in a left rail, checkboxes become switches.
- **Wins:** Zero learning curve, search always visible, room to grow new sections.
- **Costs:** Fewer tweaks visible per screen than the current two dense columns.

```text
┌──────────────────────────────────────────────────────────────────┐
│ ● ● ●  Windows Utility        🔍 Search tweaks, apps…        ⚙  │
├──────────────┬───────────────────────────────────────────────────┤
│ ⌂  Home      │  TWEAKS › CUSTOMIZE PREFERENCES                   │
│ ⬇  Install   │  Make Windows feel like yours                     │
│ 🎛  Tweaks   │  Switches apply when you press Run —              │
│ 🧰  Config   │  nothing changes yet.                             │
│ ↻  Updates   │                                                   │
│ 💿  Creator  │  ( ●) Dark Theme for Windows                      │
│              │  ( ●) Game Mode                                   │
│ Admin ✓      │  (○ ) File Explorer File Extensions               │
│ Restore      │  ( ●) End Task With Right Click                   │
│ point: today │  (○ ) Start Menu Recommendations                  │
│              │  ( ●) Scrollbars Always Visible                   │
│              │                                                   │
│              │  [ Run 6 selected tweaks ]  [ Undo selected ]     │
├──────────────┴───────────────────────────────────────────────────┤
│ Ready · 6 tweaks selected · No changes made yet                  │
└──────────────────────────────────────────────────────────────────┘
```

---

## 2 · Guided Setup Wizard

- **Idea:** The Creator tab's 3-step pattern, applied to the whole program: Safety → Apps → Tweaks → Updates → Review & Run.
- **Wins:** Nobody can run tweaks before a restore point exists; every screen explains itself.
- **Costs:** Regulars need a "skip to expert view" escape hatch.

```text
┌──────────────────────────────────────────────────────────────────┐
│ Windows Utility — Guided Setup                    Step 3 of 5    │
│ [✓ 1 Safety] [✓ 2 Apps] [3 Tweaks] [4 Updates] [5 Review & Run]  │
│                                                                  │
│  How much should we tidy up?                                     │
│  Pick one. You can fine-tune every item on the next screen.      │
│                                                                  │
│  ┌─ Minimal ─────┐ ┌─ Standard ✓ ────┐ ┌─ Advanced ──────────┐  │
│  │ Restore point │ │ Disables        │ │ Deep debloat incl.  │  │
│  │ + safe fixes  │ │ telemetry,      │ │ AppX removal.       │  │
│  │               │ │ widgets, ads    │ │                     │  │
│  │ 9 changes     │ │ 31 changes      │ │ 58 changes · ⚠      │  │
│  └───────────────┘ └─────────────────┘ └─────────────────────┘  │
│                                                                  │
│  [← Back]        Progress ██████████░░░░ 60%      [Continue →]  │
├──────────────────────────────────────────────────────────────────┤
│ ✔ Restore point created · ✔ 14 apps queued · Nothing changed yet │
└──────────────────────────────────────────────────────────────────┘
```

---

## 3 · Dashboard Home

- **Idea:** Open on answers, not lists — "Is this PC set up? What's left?" — then drill in.
- **Wins:** Updates' card design becomes the whole app's language; repeat visits take seconds.
- **Costs:** The dashboard must honestly measure state (installed apps, applied tweaks, update policy).

```text
┌──────────────────────────────────────────────────────────────────┐
│ Windows Utility — Home                      [ ▶ New PC Setup ]   │
│                                                                  │
│ ┌─ APPS ────────┐ ┌─ TWEAKS ─────┐ ┌─ UPDATES ────┐ ┌─ SAFETY ─┐ │
│ │ 34 installed  │ │ Standard     │ │ Recommended  │ │ Protected│ │
│ │ 3 updates     │ │ 31/31 ✓      │ │ Defer 365d   │ │ RP today │ │
│ └───────────────┘ └──────────────┘ └──────────────┘ └──────────┘ │
│                                                                  │
│  Start a job                                                     │
│ ┌─ ⬇ Install my usual apps ─┐ ┌─ 🎛 Re-apply tweaks ────────┐  │
│ │ Browsers, Discord, Teams, │ │ Windows reset 4 settings   │  │
│ │ 7-Zip, VLC… 14 apps       │ │ in the last update.        │  │
│ │ [ Open Install ]          │ │ [ Review 4 tweaks ]        │  │
│ └───────────────────────────┘ └────────────────────────────┘  │
│ ┌─ 💿 Build a Win11 ISO ────────────────────────────────────┐  │
│ │ Creator with your tweaks baked in, for the next machine.  │  │
│ │ [ Open Creator ]                                          │  │
│ └───────────────────────────────────────────────────────────┘  │
├──────────────────────────────────────────────────────────────────┤
│ Last run: Standard tweaks · 31 applied, 0 failed · View log      │
└──────────────────────────────────────────────────────────────────┘
```

---

## 4 · Search-First with a Run Queue

- **Idea:** One big search box (Ctrl+K) over everything — apps, tweaks, features, fixes, panels — and a queue on the right instead of five separate Run buttons.
- **Wins:** Fastest design here for anyone who knows the name of what they want; ends the "which tab was that in?" hunt.
- **Costs:** Browsing and discovering new tweaks is weaker; search quality becomes the product.

```text
┌──────────────────────────────────────────────────────────────────┐
│ ┌────────────────────────────────────────────────────────────┐   │
│ │ telemetry — 6 results across Tweaks, Config, Install  Ctrl K│   │
│ └────────────────────────────────────────────────────────────┘   │
│                                                                  │
│ [✓] Telemetry – Disable          Tweaks › Essential  [ Queued ]  │
│ [ ] Activity History – Disable   Tweaks › Essential  [ + Queue ] │
│ [ ] Location Tracking – Disable  Tweaks › Essential  [ + Queue ] │
│ [✓] Restore Point – Create       Tweaks · runs first [ Queued ]  │
│ [ ] Windows Defender Firewall    Config › Panels    [ Open ]    │
│                                                                  │
│ ┌─ RUN QUEUE · 2 ────────────────────────────────┐               │
│ │ 1 · Create Restore Point                       │               │
│ │ 2 · Disable Telemetry                          │               │
│ │ [        Run everything        ]               │               │
│ │ Apps, tweaks and fixes in one run,             │               │
│ │ safety first, in order.                        │               │
│ └────────────────────────────────────────────────┘               │
├──────────────────────────────────────────────────────────────────┤
│ Tip: press Enter to queue the top result · Queue is saved        │
└──────────────────────────────────────────────────────────────────┘
```

---

## 5 · App Store Grid

- **Idea:** Lean into what Install already almost is — a store. Bigger app tiles, category chips, installed state on every tile, and a selection tray instead of a left action column.
- **Wins:** The friendliest way to pick apps; "already installed" is obvious; the FOSS badge becomes a proper filter.
- **Costs:** Only solves Install — Tweaks and Config still need their own treatment (pair with #1 or #6).

```text
┌──────────────────────────────────────────────────────────────────┐
│ Install  (All) (Browsers) (Communications) (Development)         │
│          (Games) (Utilities) (♻ Free & Open Source)              │
│                                                                  │
│ BROWSERS                                                         │
│ ┌─ 🦁 Brave ──┐ ┌─ G Chrome ─────┐ ┌─ 🦊 Firefox ─┐ ┌─ 🌊 Edge ┐ │
│ │          ＋ │ │   INSTALLED ✓  │ │           ＋ │ │        ＋ │ │
│ └─────────────┘ └────────────────┘ └──────────────┘ └──────────┘ │
│ ┌─ 🧅 Tor ────┐ ┌─ V Vivaldi ────┐ ┌─ 🐺 LibreWolf ┐ ┌─ ◎ Zen ─┐ │
│ │          ＋ │ │             ＋ │ │            ＋ │ │        ＋ │ │
│ └─────────────┘ └────────────────┘ └───────────────┘ └──────────┘ │
│                                                                  │
│ COMMUNICATIONS                                                   │
│ ┌─ D Discord ─┐ ┌─ S Signal ─────┐ ┌─ ✈ Telegram ─┐ ┌─ zm Zoom ┐ │
│ │  QUEUED ✓   │ │             ＋ │ │           ＋ │ │        ＋ │ │
│ └─────────────┘ └────────────────┘ └──────────────┘ └──────────┘ │
├──────────────────────────────────────────────────────────────────┤
│ Selected: 1 app · Discord · via WinGet                           │
│        [ Clear ] [ Install / Upgrade Selected ] [ Uninstall ]    │
└──────────────────────────────────────────────────────────────────┘
```

---

## 6 · Master–Detail Explorer — *Best for trust*

- **Idea:** Three panes — categories, items, and a reading pane that explains the selected item in plain words before you touch it, including how to undo it.
- **Wins:** Fixes WinUtil's biggest gap: today the "?" gives almost nothing. Informed consent instead of blind ticking.
- **Costs:** Needs real, honest descriptions written for ~200 items; narrow windows must collapse the third pane.

```text
┌──────────────────────────────────────────────────────────────────┐
│ Tweaks — Explorer      Presets: (Minimal) (Standard) (Advanced)  │
├────────────┬──────────────────┬──────────────────────────────────┤
│ CATEGORIES │ [✓] Telemetry    │ SELECTED ITEM                    │
│            │ [✓] Activity     │                                  │
│ Essential  │ [ ] Widgets      │ Restore Point – Create           │
│ Advanced ⚠ │ [✓] RestorePoint │                                  │
│ Customize  │ [ ] Location     │ Takes a snapshot of Windows      │
│ Features   │ [✓] Consumer     │ settings before anything else    │
│ Fixes      │ [ ] Hibernation  │ runs. If a tweak causes trouble, │
│ Panels     │                  │ Windows Restore rolls the PC     │
│            │                  │ back to this exact moment.       │
│            │                  │                                  │
│            │                  │ Risk: none                       │
│            │                  │ Reversible: yes, any time        │
│            │                  │ Runs: first · Restart: no        │
│            │                  │                                  │
│            │                  │ In presets: Minimal ✓ Standard ✓ │
│            │                  │             Advanced ✓           │
│            │                  │ [ Keep in my selection ] [ Remove ] │
├────────────┴──────────────────┴──────────────────────────────────┤
│ 4 selected in Essential Tweaks · Run Tweaks is always bottom-right│
└──────────────────────────────────────────────────────────────────┘
```

---

## 7 · Black & Red Pro Console

- **Idea:** SEAN's family look — true black, one red accent, everything dense and keyboard-driven, and the log that is currently one line at the bottom becomes a real console.
- **Wins:** Experts see state, selection and output at once; nothing is hidden behind tabs; matches SEAN's other apps.
- **Costs:** Deliberately not beginner-friendly — this is the "expert view" other designs would link to.

```text
┌──────────────────────────────────────────────────────────────────┐
│ ■ WINUTIL PRO CONSOLE                                            │
│ [1] Install  [2] Tweaks  [3] Config  [4] Updates  [5] Creator [/]│
├──────────────────────────────────────────────────────────────────┤
│ [x] WPFTweaksTelemetry — Disable    Dark Theme          ON       │
│ [x] WPFTweaksRestorePoint — Create  File Hidden Files   OFF      │
│ [ ] WPFTweaksWidgets — Remove       Game Mode           ON       │
│ [x] WPFTweaksActivityHistory        End Task RightClick ON       │
│ [ ] WPFTweaksHiber — Disable        Start Menu Recomm.  OFF      │
│                                                                  │
│ [ RUN TWEAKS (F5) ] [ UNDO ]                                     │
│ preset: STANDARD · selected: 11 · dry-run: OFF                  │
├──────────────────────────────────────────────────────────────────┤
│ [19:02:11] Restore point created OK                              │
│ [19:02:14] HKLM\...\DataCollection AllowTelemetry = 0 ✓          │
│ [19:02:15] Installing WPFFeaturesSandbox (1/1)…                  │
└──────────────────────────────────────────────────────────────────┘
```

---

## 8 · Light & Large — Accessible First

- **Idea:** Design for the person setting up a parent's PC: light theme, 16px+ type, one column, sentences instead of compressed labels.
- **Wins:** Readable at 200–300% scaling and on touch; switches and buttons are big targets; no squinting at grey-on-grey.
- **Costs:** Long lists scroll a lot — needs strong section jump-links and search.

```text
┌──────────────────────────────────────────────────────────────────┐
│ Windows Utility            Text size: A−  A  A+      🌗 Theme    │
│                                                                  │
│ ( Tweaks ) ( Install apps ) ( Fix problems ) ( Updates )         │
│                                                                  │
│ ┌────────────────────────────────────────────────────────────┐   │
│ │ ( ●── )  Stop Windows sending usage data (telemetry)       │   │
│ │          Recommended. Windows keeps working exactly        │   │
│ │          the same.                                         │   │
│ └────────────────────────────────────────────────────────────┘   │
│ ┌────────────────────────────────────────────────────────────┐   │
│ │ ( ●── )  Make a safety snapshot first (restore point)      │   │
│ │          So you can undo everything. We suggest            │   │
│ │          leaving this on.                                  │   │
│ └────────────────────────────────────────────────────────────┘   │
│ ┌────────────────────────────────────────────────────────────┐   │
│ │ ( ──○ )  Remove the Widgets news panel                     │   │
│ │          The weather-and-news panel on the taskbar.        │   │
│ │          You can bring it back any time.                   │   │
│ └────────────────────────────────────────────────────────────┘   │
│                                                                  │
│ [      Apply my 2 choices      ]  [ Show me everything (expert) ]│
├──────────────────────────────────────────────────────────────────┤
│ Nothing changes until you press Apply · Every choice can be      │
│ undone from this same screen                                     │
└──────────────────────────────────────────────────────────────────┘
```

---

## 9 · Preset Matrix

- **Idea:** Answer the question the current Tweaks tab can't: "What exactly does Standard do that Minimal doesn't?" One table, presets as columns, differences in plain sight.
- **Wins:** Presets stop being a leap of faith; the Custom column turns the table itself into the editor.
- **Costs:** A wide table — on small windows it must switch to comparing two presets at a time.

| Tweak | Minimal | Standard | Advanced | Custom (you) |
|-------|:-------:|:--------:|:--------:|:------------:|
| Create Restore Point | ● | ● | ● | ✓ |
| Disable Telemetry | ● | ● | ● | ✓ |
| Disable Activity History | ○ | ● | ● | ✓ |
| Remove Widgets | ○ | ● | ● | ☐ |
| Disable Hibernation | ○ | ○ | ● | ☐ |
| AppX / bloatware removal | ○ | ○ | ● ⚠ | ☐ |
| Updates: Recommended profile | ● | ● | ○ | ✓ |
| **Total changes** | **9** | **31** | **58** | **4 so far** |

● = included · ○ = not included

- Click any row to read what it does (#6's explanation pane belongs here too).
- Start from a preset, change one box, and it becomes your Custom column — saveable as a recipe (#10).
- **[ Run my Custom column ]** · **[ Save as recipe… ]**
- Preset definitions come from the same `preset.json` the command line uses — the table can't drift from reality.

---

## 10 · Recipe Builder — *Standout feature*

- **Idea:** A setup is a thing you build once, name, save, export, and re-run — "Sean's New PC", "Gaming Rig", "Office Debloat". Library on the left, your recipe in the middle, sharing on the right.
- **Wins:** Turns one-off ticking into a reusable asset; recipes are just the JSON WinUtil already loads, so they can be shared and versioned.
- **Costs:** The biggest build of the ten — needs save/load, ordering rules (restore point always first) and a run report.

```text
┌──────────────────────────────────────────────────────────────────┐
│ Recipes  (Sean's New PC) (Gaming Rig) (Office Debloat) (＋ New)  │
│                                              [ ▶ Run this recipe ]│
├──────────────┬───────────────────────────────┬───────────────────┤
│ LIBRARY      │ RECIPE · runs top to bottom   │ SHARE THIS SETUP  │
│ drag in,     │                               │                   │
│ or click +   │ 1 · Safety                    │ Export .json      │
│              │    Create Restore Point       │ Import            │
│ + Firefox,   │    (always first, can't be    │ Copy link         │
│   Chrome     │     removed)                  │                   │
│ + Discord,   │ 2 · Install — 14 apps, WinGet │ Version 3         │
│   Telegram   │ 3 · Tweaks — Standard,        │ Edited today      │
│ + 7-Zip, VLC │    minus Widgets removal      │                   │
│ + Telemetry  │ 4 · Updates — Recommended     │ [ Export recipe ] │
│ + .NET       │                               │                   │
│ + Net Reset  │ + Drop the next step here —   │ Last run: this PC │
│ + Updates    │   Features, Fixes, or a       │ 31 steps, 0 failed│
│              │   Win11 Creator ISO           │                   │
├──────────────┴───────────────────────────────┴───────────────────┤
│ Recipes use WinUtil's existing preset/config format —            │
│ no new file type to invent                                       │
└──────────────────────────────────────────────────────────────────┘
```

---

## Verdict

If WinUtil ever gets one redesign, I'd ship **#1 as the shell** (it's the layout Windows users already have in muscle memory), put **#3's home dashboard** inside it, borrow **#6's explanation pane** for Tweaks, keep **Updates' three cards and the Creator's step flow** almost as they are — they're already the best-designed screens in the current app — and add **#10 Recipes** as the feature that makes the redesign worth doing.

#2 and #8 are really the same lesson at two sizes: plain sentences and a safe order help more people than any new colour scheme. #4, #7 and #9 are expert accelerators — best offered as alternate views inside the main shell, not as the only door in.

---

*Based on: Chris Titus Tech WinUtil (github.com/ChrisTitusTech/winutil) and the five tab screenshots supplied 2026-10-25 — Install, Tweaks, Config, Updates, Win11 Creator. Mockups are original redesigns using WinUtil's real labels and content; no upstream artwork copied.*
