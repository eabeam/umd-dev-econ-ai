# Templates

Working versions of everything the lecture refers to. These aren't rules — they're starting points. Copy them into your repo, adapt them to your project, and by December they'll be *yours*.

| File | What it is |
|---|---|
| [`00_config.do`](00_config.do) | The paths file every other file includes. Pairs with `config_local_template.do`. |
| [`config_local_template.do`](config_local_template.do) | Copy to `config_local.do` (gitignored), set your project root. The one file with a real path in it. |
| [`cleaning_file_template.do`](cleaning_file_template.do) | Skeleton for a cleaning file: load raw, clean, validate, save. |
| [`analysis_file_template.do`](analysis_file_template.do) | Skeleton for a self-contained analysis file: one file, one table. |
| [`AGENTS.md`](AGENTS.md) | House-style instructions for AI agents working in your repo — the file that keeps agent code readable and its decisions visible. Adapt the rules to your taste, but have the file. (Opens as plain text — copy it into your repo.) |

A note on the config pattern: the lecture shows the one-file version (`config.do` with a `global root`), which is fine for a solo project. The two-file version here is the sharing-ready upgrade — the committed `00_config.do` never contains a personal path, so the repo runs on any machine after one copy-and-edit.
