# M1 · Terminal & Bash <span class="week-pill">Weeks 1–2</span>

**Goal:** stop being afraid of the black screen. By the end you can navigate Linux, manipulate files and text, and write a small script — the single most transferable skill in all of cybersecurity.

*Reinforces: CSIS 6010 Linux/Unix for Cybersecurity.*

## 🎥 Watch

Pick the one that clicks for you — both cover the essentials.

<div class="yt"><iframe src="https://www.youtube.com/embed/sWbUDq4S6Y8" title="Introduction to Linux – Full Course for Beginners (freeCodeCamp)" allowfullscreen></iframe></div>

*Introduction to Linux – Full Course for Beginners — freeCodeCamp.* Watch the first ~2 hours; you'll come back for more.

<div class="yt"><iframe src="https://www.youtube.com/embed/ZtqBQ68cfJc" title="The 50 Most Popular Linux & Terminal Commands (freeCodeCamp)" allowfullscreen></iframe></div>

*The 50 Most Popular Linux & Terminal Commands — freeCodeCamp.* This is your command dictionary in video form.

For a security-flavoured take, NetworkChuck's energetic **[Linux for Hackers](https://www.youtube.com/playlist?list=PLIhvC56v63IJIujb5cyE13oLuyORZpdkL)** series and TCM's **[Beginner Linux for Ethical Hackers](https://www.youtube.com/playlist?list=PLLKT__MCUeiwfK18Io6kvwrrhqQyQnV5W)** are both excellent and free.

Then, to script:

<div class="yt"><iframe src="https://www.youtube.com/embed/tK9Oc6AEnR4" title="Bash Scripting Tutorial for Beginners (freeCodeCamp)" allowfullscreen></iframe></div>

## 🛠️ Do — the Bash CTF (13 levels)

This repo ships a **Capture-The-Flag game** that teaches Bash by making you *use* it. It's already set up in your Codespace.

```bash
cd labs/01-bash
cat playground/level-00/README     # start here
./check.sh 0 'FLAG{...}'           # submit a flag when you find one
```

Each level teaches one skill: hidden files, `find`, `grep`, permissions, `base64`, ROT13, archives, `strings`, talking to a web service with `curl`, and more. Full instructions: [Bash CTF page](../ctf/bash-ctf.md).

## 🏁 Capture

- [ ] Solve **all 13 CTF levels** (0–12).
- [ ] Write a script `hello.sh` that asks your name and greets you (from the Bash video).
- [ ] Learn to **save your work with Git** — watch this and push your progress:

<div class="yt"><iframe src="https://www.youtube.com/embed/RGOj5yH7evk" title="Git and GitHub for Beginners (freeCodeCamp)" allowfullscreen></iframe></div>

```bash
git add -A && git commit -m "Finished Module 1" && git push
```

## ✅ Check-in with Pranith

Show him: your `.progress` folder with 13 solved levels, your `hello.sh`, and one paragraph in your [journal](../journal.md) about which level was hardest and why.
