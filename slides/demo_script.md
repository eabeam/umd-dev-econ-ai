# Live Demo Script — UMD Guest Lecture Aug 31, 2026
**"Good Research Programming with AI Agents"**
Estimated time: 12–15 minutes | Fits in the optional 30-min hands-on extension slot

---

## Prerequisites (do before lecture, day-before dry-run required)

- [ ] LSMS extract staged: a public LSMS module (e.g., Ethiopia ESS or Uganda UNPS HH consumption module), CSV or Stata `.dta` format, in `~/demo/data/raw/`
  - **Fallback if DUA step is slow**: Use TwA c3 synthetic labor survey (`exercises/c3/synthetic_labor_survey.csv`) — already in the repo, no DUA needed. Update demo prompts to say "labor survey" not "LSMS."
  - Required file: one module with HH weights (variable name to confirm pre-demo)
- [ ] `~/demo/` folder structure staged: `data/raw/`, `data/clean/`, `code/`, `output/`, `docs/` — use the gitignore template already in the repo
- [ ] `docs/LSMS_documentation.pdf` (or the module codebook) staged — Codex will read it
- [ ] `code/decisions_log.md` exists (copy from `materials/cleaning_decision_log.md`)
- [ ] VS Code open to `~/demo/`, Codex active, Git initialized, first commit already done ("project scaffold")
- [ ] Stata MP available in PATH (check: `which stata-mp` or `which stata`)

---

## Beat 1 — Open the project (30 seconds)

**What you say:**
> "I'm going to build a weighted household summary table — the kind of thing every empirics class assignment asks for in the first week. I'll use Codex, which is the agent mode in VS Code. Watch what I actually type."

**What you do:**
- Show the VS Code window. Point to the folder tree: `data/raw/`, `code/`, `docs/`
- Click to open `docs/LSMS_documentation.pdf` or the codebook page for the module you're using

**What you say:**
> "Step one: the agent reads the documentation with me. Not instead of me — WITH me. I'm going to give it the codebook and ask it to find the weight variable."

**Prompt to Codex (type live):**
```
@docs/LSMS_documentation.pdf  
What is the household sampling weight variable in this module? What does it represent and how should I apply it in Stata?
```

**Expected output:** Codex returns the variable name (e.g., `hhweight` or `pw`), its description, and a note about `[pweight]` in Stata.

**Recovery if Codex misreads the PDF:** Switch to a plain-text codebook excerpt. Say: "PDF parsing is one of those things — let me give it the text directly." Paste the relevant 5 lines from the codebook.

---

## Beat 2 — Agent builds the weighted summary table (3–4 minutes)

**What you say:**
> "Now I'm going to ask it to build the actual code. Watch the prompt — this is where the quality of what comes out is set."

**Prompt to Codex (type live):**
```
Using the LSMS module in data/raw/, write a Stata do-file that:
1. Loads the data
2. Applies the sampling weight [pweight = hhweight] (or whatever variable Codex identified)  
3. Produces a weighted summary table: mean, SD, N for the three main household consumption variables
4. Saves the output table to output/table1_summary.xlsx
5. Follows the coding style in code/clean_household.do if it exists — plain Stata, comment the why

Save as code/table1_summary.do
```

**What you do while Codex writes:**
- Narrate what you're watching: "It's opening a file. It's writing the globals. Here's where it sets the path — that's always the first thing to break on a collaborator's machine."
- Do NOT hover anxiously. Watch casually.

**When it finishes:**
- Open `code/table1_summary.do` in the diff view. Say: "This arrived as a diff — I can see every line before I accept it. I'm going to read the weight application."
- Point to the `svyset` or `[pweight]` line. Say: "Good — it used the weight we found."

---

## Beat 3 — Agent runs Stata, reads the log, fixes its own error (3–4 minutes)

**What you say:**
> "Now: the agent can run Stata itself. Batch mode. Watch."

**Prompt to Codex:**
```
Run this do-file in Stata batch mode and show me the log.
```

**What Codex does:** Runs `stata-mp -b do code/table1_summary.do` (or equivalent). Log appears in the terminal.

**Planted error (set up before the demo):** The do-file will have a path error or a variable name mismatch — either the raw data file has a slightly different name, OR one of the consumption variables is named differently than in the codebook. This is real and will happen naturally; you don't need to plant it if the data/codebook mismatch is genuine.

**What you say when Stata errors:**
> "It errored. Now watch what happens."

**Prompt to Codex:**
```
Stata returned an error. Read the log and fix the do-file.
```

**What Codex does:** Reads the `.log` file, identifies the error (variable not found, file path wrong, etc.), proposes a fix, edits the do-file, runs again.

**What you say:**
> "It read its own error, figured out what was wrong, and fixed it. I didn't touch the log. This is what 'batch mode + log reading' actually means."

**Recovery if Stata isn't running:** Say "Stata's not cooperating live, which is fine — let me show you what the log looks like when it errors." Switch to a pre-run log file in `docs/demo_log_with_error.log`. Walk through Codex's reading of it.

---

## Beat 4 — Planted undocumented decision (2 minutes)

**What you say:**
> "The table came out. But look at this."

Point to a line in the do-file where Codex quietly did something non-obvious — for example:
- It dropped observations with `if hhweight > 0` (quietly excluding zero-weight HHs)
- It used `svy: mean` instead of `mean ... [pweight]` (different variance estimator)
- It kept only complete cases on all three variables

**What you say:**
> "It made a decision. It didn't tell me. If I submit this table, I don't know what's in it."

**What you do:**
> "This is what the decisions log is for."

Open `code/decisions_log.md`. **Prompt to Codex:**
```
You dropped observations with hhweight == 0. Add an entry to decisions_log.md documenting this choice: what you did, why, and what the alternative would have been.
```

**Codex writes the log entry.** Show it. Say:
> "Now when my co-author asks 'why is N 1,847?', I have a paper trail. And it cost me one prompt."

---

## Beat 5 — Commit (30 seconds)

**What you say:**
> "Last step. Every time something works, you commit."

Open the Source Control panel in VS Code. The changed files show up.

**Prompt to Codex:**
```
Commit this with a sensible message.
```

Codex stages and commits. Show the commit message.

**What you say:**
> "That's the loop: checkpoint → delegate → read the diff → keep or discard → commit. Four steps. You own all four. The agent does the typing."

---

## Beat 6 — 60-second copy-paste anti-pattern (1 minute)

**What you say:**
> "Before I stop — the thing I most want you to avoid."

Switch to a plain text editor (not VS Code). Type a Python snippet or a Stata command that you've visibly copied from somewhere.

**What you say:**
> "This is how a lot of AI-assisted code gets written. Someone pastes something, it runs, they move on. The code works. Until it doesn't."
> "You don't know what's in it. You can't explain it to a referee. You can't debug it at 11pm the night before submission."
> "The workflow I just showed you — prompt, diff, read, commit — is slower. That's the point. The slowness is where the understanding lives."

---

## Closing line

**What you say:**
> "Everything I just did is in the repo. Go fork it, break it, and fix it before Assignment 1 is due. That's the setup guide's job."

---

## Pre-demo checklist (30 min before)

- [ ] Stata license active and `stata-mp -b` runs in terminal
- [ ] LSMS module in `data/raw/` with weight variable confirmed
- [ ] Codebook open in `docs/`
- [ ] `decisions_log.md` exists (blank is fine)
- [ ] VS Code open, Codex active, Copilot/other assistants disabled for clarity
- [ ] Git initialized, first commit done
- [ ] Demo log with error pre-saved at `docs/demo_log_with_error.log` (fallback)
- [ ] Zoom screen share tested — share the VS Code window, NOT the full screen
- [ ] Dry-run completed Aug 28 (per timeline)

---

## Data prerequisite note

The LSMS module needs:
1. A weight variable (sampling weight at HH level)
2. 2–3 numeric variables to summarize (consumption expenditure, income, or similar)
3. Public license — World Bank Open Data or confirmed DUA-free module

If the World Bank microdata portal DUA step takes time: use `exercises/c3/synthetic_labor_survey.csv` from the teaching-ai repo. It has weights (`sample_weight`) and 3 numeric outcome variables. Prompts stay identical; just change "LSMS" to "labor survey" in the live narration.
