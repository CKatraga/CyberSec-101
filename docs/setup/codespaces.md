# Set up your cloud workspace

For the first half of the course you don't need to install anything scary. You get a **full Linux machine in your browser** using **GitHub Codespaces** — free for students.

!!! info "Why not Gitpod?"
    The original plan mentioned Gitpod. Gitpod's classic browser workspaces were **shut down (Oct 2025)** and the product is now the paid "Ona" platform. **GitHub Codespaces** is the current best free option for a student, and this repo already includes the setup files for it. (If you ever want a local option instead, everything also runs in **VS Code + Dev Containers** on your own laptop with Docker.)

## Step 1 — Get the student benefits (free)

1. Create a free account at [github.com](https://github.com).
2. Apply for the **GitHub Student Developer Pack** at [education.github.com/pack](https://education.github.com/pack) using your **AUM email**. Verified students get **180 core-hours/month** of Codespaces free — plenty for this course.

## Step 2 — Open the course repo in a Codespace

1. Pranith will share the repository link with you (he hosts it on GitHub).
2. On the repo page, click the green **`< > Code`** button → **Codespaces** tab → **Create codespace on main**.
3. Wait ~2–3 minutes the first time. It's building your Linux machine and installing all the tools (nmap, wireshark/tshark, python, openssl, john, and more) automatically.

When it finishes you'll see VS Code in your browser with a **terminal** at the bottom. That terminal is a real Linux shell. This is where you live.

## Step 3 — First commands

Type these to confirm everything works:

```bash
whoami
uname -a
nmap --version
python3 --version
```

## Step 4 — Preview this course site inside the workspace

```bash
mkdocs serve -a 0.0.0.0:8000
```

Then open the forwarded **port 8000** (a popup appears, or check the **Ports** tab). You now have the course open next to your terminal.

## Step 5 — Start the first lab

```bash
cd labs/01-bash
cat playground/level-00/README
```

Head to [Module 1](../modules/01-bash.md).

!!! tip "Saving your work"
    A Codespace pauses when idle and can be deleted after 30 days of inactivity. Your **flags and journal** live in this repo, so `git add -A && git commit -m "progress" && git push` at the end of each session (Pranith will show you — it's also literally [Module 1's](../modules/01-bash.md) Git skill).
