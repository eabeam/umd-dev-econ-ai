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
