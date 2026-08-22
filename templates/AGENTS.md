# AGENTS.md — house rules for AI agents in this repo

*Template — adapt the specifics to your project, but have this file. Codex and most coding agents read it automatically when working in your repo; it's how your standards survive delegation.*

## Project

Stata project analyzing the [COUNTRY, YEAR] LSMS survey.
Structure: `code/cleaning/` builds `data/clean/` from `data/raw/`; `code/analysis/` is one self-contained file per table or figure, writing to `output/`. Paths come from `00_config.do` — never hardcode a path.

## Style

- Plain Stata. Prefer four clear lines over one clever one.
- Comments explain **why**, not what — cite the questionnaire item, BID page, or reading that justifies a choice.
- Match the naming and layout of existing files in this repo (see `code/cleaning/01_clean_household.do`).
- Tables via `esttab`, labeled variables, booktabs. A table should be readable without opening the code.

## Rules

- **Never** modify anything in `data/raw/` — it is read-only, always.
- **Never** impute, drop, winsorize, recode, or restrict the sample without saying so explicitly in your response — these are research decisions, and each one gets an entry in the decisions log.
- Report the change in N after any operation that affects the sample.
- **You keep the log**: after any research decision, append a drafted entry to the decisions log (what you found, what you did, alternative considered, N impact) for my review. I approve or correct — but you write it, at the moment it happens.
- Run do-files with `stata-mp -b do <file>.do`, read the `.log`, and report errors honestly — do not paper over a failed run.
- Don't add dependencies (user-written packages) without flagging them; anything required must be documented for replication.

## Bonus rules — optional, but they've earned their place in my own projects

*Each of these exists because an agent (or I) got it wrong once. Take the ones that fit your project.*

**Running code**

- Stata batch mode **always exits 0**, even when the do-file failed. After `stata-mp -b`, search the `.log` for a line matching `r(#);` (e.g. `r(111);`) before reporting success. No `r(` line = clean run; anything else = stop and show me.
- Every do-file runs on its own: `capture log close _all` at the top, then `if "$config_loaded" != "1" include "00_config.do"`, then load its own data. Never write a file that only works if something else ran first.
- No `capture` around logic — not `capture drop`, not `capture gen`, not a block. The variable either should exist or shouldn't; `capture` hides the error I needed to see. (Master files wrapping whole phases are the one exception.)

**Data**

- After every `merge`: `assert inlist(_merge, 1, 3)` (or whichever pattern is expected), then `drop _merge`. Never `merge m:m`; never `merge ..., force` — if types clash, fix the types.
- `isid <key>` before every `save`.
- `egen rowtotal()` treats missing as zero. Any summed index or aggregate (consumption, assets, income) sets the total to missing when any component is missing, unless the decisions log says otherwise. This is the most common silent N-preserving choice in survey work.

**Tables**

- Write the `esttab` call out literally, in the same file as the regressions it exports. No table settings assembled in macros elsewhere; loops only when every iteration is truly identical. In analysis code, repetition is cheaper than indirection — a coauthor should be able to change a column header by editing one obvious line.
- No number in a write-up is ever typed by hand; it comes from stored results. After every export, `confirm file` so a silent failure stops the run.
- `esttab ... keep(varname)` with a misspelled name gives an empty row, not an error. Eyeball row counts on the first build of any table.
