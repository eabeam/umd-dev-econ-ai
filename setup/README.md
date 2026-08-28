# Setup guide — do this before August 31

Everything here is one-time setup, so class time can go to actual work. Budget **about an hour**, plus a few days' wait for the GitHub student-benefits verification (step 4), which is out of your hands — **start that one today**.

Getting stuck somewhere is normal — note where, move on, and bring it to the first session.

## Checklist

- [ ] 1. ChatGPT subscription ($20/mo)
- [ ] 2. VS Code installed, Codex extension working
- [ ] 3. Git installed
- [ ] 4. GitHub account + free student benefits + your personal course repo
- [ ] 5. World Bank microdata account
- [ ] 6. The five-minute test

---

## 1. ChatGPT subscription

The course workflow uses an AI agent that comes with a paid ChatGPT plan. Two routes:

- **Route A (default): personal ChatGPT Plus, $20/month.** Go to [chatgpt.com](https://chatgpt.com), sign in (create an account with any email), and upgrade to Plus from the account menu. Plus covers a course's workload if you work in sessions — Codex on Plus has a rolling usage cap (currently five-hour windows), so if you hit it, take a break rather than upgrade. You can cancel after the semester.
- **Route B: a UMD-licensed seat.** UMD sells ChatGPT Enterprise seats through DIT, but they're $30+/month per user and each request needs a departmental budget approver — so this only makes sense if your program is covering it. If it is, request a seat at [chatgpt-licensing.umd.edu](https://chatgpt-licensing.umd.edu/) and confirm Codex is included in your tier. If you're not sure, use Route A and don't wait.

*Prefer Claude?* That's fine — but at the $20 tier expect to hit usage limits with agent-style work; you'd likely need a heavier plan. The class demos use the ChatGPT/Codex stack.

## 2. VS Code + the Codex extension

VS Code is a free code editor; the Codex extension puts the AI agent in a panel next to your code.

1. Download and install VS Code: [code.visualstudio.com](https://code.visualstudio.com/)
2. Open VS Code → click the **Extensions** icon in the left sidebar (four squares) → search **"Codex"** → install the extension published by **OpenAI**.
3. Click the Codex icon that appears in the sidebar and **sign in with your ChatGPT account** from step 1.
4. Reference docs if anything looks different: [developers.openai.com/codex/ide](https://developers.openai.com/codex/ide)

## 3. Git

Git tracks versions of your code. (Concepts come later — right now just install it.)

- **Mac**: open Terminal, type `git --version`, press Enter. If it's not installed, macOS will offer to install it — accept.
- **Windows**: download from [git-scm.com/downloads](https://git-scm.com/downloads) and install with default options.

Then set your identity (in Terminal / Git Bash), using the same email you'll use for GitHub:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@umd.edu"
```

## 4. GitHub account, student benefits, and your course repo

1. Create an account at [github.com](https://github.com) **using your UMD email** (or add your UMD email to an existing account).
2. Apply for the free **GitHub Student Developer Pack**: [education.github.com/pack](https://education.github.com/pack). Verification can take a few days — this is the one "start today" item. It includes **GitHub Copilot free for verified students** (AI autocomplete inside VS Code — different tool-fit from Codex; we'll cover when to use which in the lecture).
3. Create **your own personal repository** for the course: on GitHub click **New repository** → name it something like `lsms-project` → **Private** → check "Add a README" → Create. This repo is *yours* — it outlives the course, and your submission at semester's end is simply its link.
4. **Share it with your instructor**: on your repo's page, **Settings → Collaborators → Add people** → her GitHub username (she'll send it). A private repo is invisible to everyone else — the link you submit only works once she's a collaborator.
5. Connect it to your computer: in VS Code, open the Command Palette (`Cmd/Ctrl+Shift+P`) → type **"Git: Clone"** → paste your repo's URL → choose a folder you'll remember (e.g., `Documents/lsms-project`).

*Want the concepts behind steps 3–5?* Short reads: [Terminal Basics](https://eabeam.github.io/teaching-ai/modules/b1-terminal-basics.html) and [Git & GitHub Essentials](https://eabeam.github.io/teaching-ai/modules/b2-git-github.html). And you never have to type Git commands if you don't want to: the [Source Control panel](../materials/git_in_vscode.md) is all buttons, [GitHub Desktop](https://desktop.github.com/) is a friendly standalone app, and the agent will happily drive Git for you.

## 5. World Bank microdata account

Assignment 1 uses an LSMS survey, which you download through a free World Bank microdata account. Access is granted per survey: once you've picked a country-year, you request access to that survey's files (a short form, approved instantly).

1. Go to the LSMS catalog: [microdata.worldbank.org/index.php/catalog/lsms](https://microdata.worldbank.org/index.php/catalog/lsms)
2. Create an account (top right).
3. When you've chosen a survey (a country-year with a full household module — details in Assignment 1), open its page, click **Get Microdata**, and request access to the files.

Background on the program: [worldbank.org/en/programs/lsms](https://www.worldbank.org/en/programs/lsms)

## 6. The five-minute test

You're done when all four of these work:

1. Open your cloned course repo folder in VS Code (**File → Open Folder**).
2. Open the Codex panel and ask: *"Create a file called `hello.do` that displays 'setup works'."* Watch it propose the file; accept the change.
3. Run the file in Stata (or your package of choice) — confirm it runs.
4. Commit and push: in VS Code's **Source Control** panel (left sidebar), type a message like `test: setup works`, click **Commit**, then **Sync/Push**. Refresh your repo page on GitHub — `hello.do` should be there.

If all four worked, that's the entire semester's workflow in miniature: **agent writes → you review → it runs → you check the output → you commit.** See you August 31!

---

## Nice extras (optional, five minutes)

VS Code earns its keep beyond the agent. Worth installing while you're in the Extensions marketplace:

- **LaTeX Workshop** — compile your papers in the same window as your code (the agent can edit `.tex` files too)
- A **Stata** syntax-highlighting extension — search "Stata," pick the popular one
- Markdown preview is built in — open any `.md` file and press `Cmd/Ctrl+Shift+V`

---

## A note on Stata

Stata stays our default language, and it plays nicely with this workflow. Two ways to run your code, and you'll use both:

- **You run it**: open the `.do` file in Stata as usual. Good when you're exploring interactively.
- **The agent runs it**: Stata has a batch mode that writes a `.log` file, so the agent can run your do-file, read the log, and fix its own errors. The exact command depends on your edition and machine — on Mac something like `stata-se -b do myfile.do` (swap `-mp`/`-be` for your edition; the binary lives inside the Stata app bundle, under `Contents/MacOS/`), on Windows `StataSE-64.exe /e do myfile.do`. Good first agent task: *"figure out the batch-mode command for my Stata install and add it to AGENTS.md."*

Either way, the part that can't be delegated is the same: *you* read the output and decide whether it's right. (You may also use R, Python, or anything else — the workflow is identical, minus the batch-mode wrinkle.)
