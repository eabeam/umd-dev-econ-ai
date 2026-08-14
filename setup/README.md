# Setup guide — do this before August 31

Everything here is one-time setup, so class time can go to actual work. Budget **about an hour**, plus waiting time for two approvals (steps 4 and 5) that are out of your hands — **start those today**.

Getting stuck somewhere is normal — note where, move on, and bring it to the first session.

## Checklist

- [ ] 1. ChatGPT subscription ($20/mo)
- [ ] 2. VS Code installed, Codex extension working
- [ ] 3. Git installed
- [ ] 4. GitHub account + free student benefits + your personal course repo
- [ ] 5. World Bank microdata account (start today — approval lag)
- [ ] 6. The five-minute test

---

## 1. ChatGPT subscription

The course workflow uses an AI agent that comes with a paid ChatGPT plan. Two routes — **either is fine**:

- **Route A (always works): personal ChatGPT Plus, $20/month.** Go to [chatgpt.com](https://chatgpt.com), sign in (create an account with any email), and upgrade to Plus from the account menu. A Plus plan should comfortably cover this course's workload; you can cancel after the semester.
- **Route B: UMD ChatGPT Enterprise.** UMD has an institutional ChatGPT agreement. Email UMD IT and ask whether graduate students can get a ChatGPT Enterprise/Edu seat that includes **Codex** access. If the answer is slow or unclear, don't wait — use Route A.

*Prefer Claude?* That's allowed — but at the $20 tier expect to hit usage limits with agent-style work; you'd likely need a heavier plan. The class demos use the ChatGPT/Codex stack.

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
2. Apply for the free **GitHub Student Developer Pack**: [education.github.com/pack](https://education.github.com/pack). Verification can take a few days — this is one of the two "start today" items. It includes **GitHub Copilot free for verified students** (AI autocomplete inside VS Code — different tool-fit from Codex; we'll cover when to use which in the lecture).
3. Create **your own personal repository** for the course: on GitHub click **New repository** → name it something like `lsms-project` → **Private** → check "Add a README" → Create. This repo is *yours* — it outlives the course, and your submission at semester's end is simply its link.
4. Connect it to your computer: in VS Code, open the Command Palette (`Cmd/Ctrl+Shift+P`) → type **"Git: Clone"** → paste your repo's URL → choose a folder you'll remember (e.g., `Documents/lsms-project`).

*Want the concepts behind steps 3–4?* Short reads: [Terminal Basics](https://eabeam.github.io/teaching-ai/modules/b1-terminal-basics.html) and [Git & GitHub Essentials](https://eabeam.github.io/teaching-ai/modules/b2-git-github.html).

## 5. World Bank microdata account (start today)

Assignment 1 requires downloading an LSMS survey, which requires a (free) World Bank microdata account and a data-use agreement — and approval is not instant.

1. Go to the LSMS catalog: [microdata.worldbank.org/index.php/catalog/lsms](https://microdata.worldbank.org/index.php/catalog/lsms)
2. Create an account (top right).
3. Browse surveys now if you like (choose a country-year with a full household module — details in Assignment 1), but at minimum **get the account created** so the data-use agreement is the only step left when you pick.

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

Stata stays our default language (matching your econometrics sequence), and it plays nicely with this workflow. Two ways to run your code, and you'll use both:

- **You run it**: open the `.do` file in Stata as usual. Good when you're exploring interactively.
- **The agent runs it**: Stata has a batch mode (`stata-mp -b do myfile.do` from the terminal), which writes a `.log` file — so the agent can run your do-file, read the log, and fix its own errors. We'll set this up together in the first session if it doesn't work out of the box on your machine.

Either way, the part that can't be delegated is the same: *you* read the output and decide whether it's right. (You may also use R, Python, or anything else — the workflow is identical, minus the batch-mode wrinkle.)
