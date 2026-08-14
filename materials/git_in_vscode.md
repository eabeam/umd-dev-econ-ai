# Git in VS Code

Everything Git does day-to-day lives in one place: the **Source Control panel** — the branching icon in the left sidebar (`Ctrl/Cmd+Shift+G`). Here's your way around it.

## Reading the panel

- **A number badge** on the icon = how many files have changed since your last commit
- Each changed file is listed with a letter: **M** modified · **U** new (untracked) · **D** deleted
- In the file tree and editor tabs, changed files are also color-tinted, and edited lines get a colored bar in the margin — blue for changed, green for new

## The daily loop (no terminal required)

1. **Click a changed file** in the panel → a side-by-side diff opens: old on the left, new on the right. *This is the step that matters — especially when the agent did the editing.*
2. **Stage** what you want to keep: the `+` next to a file (or skip staging — committing everything at once is fine at this scale)
3. **Type a message** in the box ("add weighted summary table") and click **Commit**
4. Click **Sync Changes** to push to GitHub

## The undo moves

- **Discard changes** (right-click a file → Discard Changes, or the ↩ icon): file goes back to the last commit. This is your escape hatch when an agent edit went sideways.
- **Timeline** (bottom of the Explorer sidebar, with a file open): every commit that touched this file — click one to see that version
- Committed something embarrassing? It's fine — the history is append-only, and the next commit just moves forward. Nothing is ever lost.

## Or don't drive at all

Two legitimate alternatives:

- **[GitHub Desktop](https://desktop.github.com/)** — a standalone app that does the same loop with friendlier furniture. Nothing wrong with it; several very good economists use nothing else.
- **Ask the agent** — "commit what we just did with a sensible message" works. The agent is good at Git; it's a language model and Git is a language. You still read the diff first — that part doesn't delegate.
