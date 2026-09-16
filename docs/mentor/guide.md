# Mentor guide (for Pranith)

This page is for you, not Chandana. It's the operating manual for mentoring her through this course.

## The situation, honestly

Chandana is in her final MS Cybersecurity semester at AUM but has been studying to *pass*, not to *understand*. She's a **visual + practical learner**. So the whole design here is: **short video → immediately do it → capture a flag → talk about it.** Minimize passive reading; maximize doing.

## Your job each week

1. **Unblock, don't solve.** When she's stuck, ask "what does the error say?" and "what have you tried?" before giving the answer. Give hints, not solutions.
2. **Verify the doing.** Don't accept "I watched it." Ask to see the flag, the screenshot, the script output. The [progress tracker](../progress.md) is your dashboard.
3. **Keep momentum.** One module at a time. If a module drags past its week, cut scope (fewer labs) rather than let her stall.
4. **Connect to her degree.** Every module maps to an AUM course she's taken — remind her, it builds confidence ("you already did this in Report 7").

## Weekly rhythm (~30–45 min call)

- She demos what she captured (flag / screenshot / script).
- You quiz her on 3–5 concepts from the module (see check-in prompts at the bottom of each module page).
- Pick next module; agree on what "done" looks like.
- She commits her progress + journal before you hang up.

Use the [check-in template](checkin.md) to keep notes.

## Phase gates

- **Weeks 1–10** run entirely in **GitHub Codespaces** (browser). No install friction — good, because setup pain is where beginners quit.
- **Week 11** is the **Kali install call** — do this live with her (see [Kali setup](../setup/kali.md)). She's on **Windows**, so it's **VirtualBox + the prebuilt Kali image**. Watch for the two classic snags: **VT-x/AMD-V disabled in BIOS** and **Hyper-V conflicting with VirtualBox**. If her laptop is low on RAM (≤8 GB) and struggles, fall back to **TryHackMe's in-browser Kali** — she can do Modules 7–9 entirely there.

## Grading her readiness (be generous but honest)

She's "job-ready-junior" when she can, unprompted:

- Navigate Linux and write a basic script.
- Run and *explain* an nmap scan.
- Describe the CIA triad and 5 common attacks in plain English.
- Perform one SQL injection and state the fix.
- Read a packet capture and find something interesting.
- Write a short, clear findings report (the capstone).

## Certifications = the finish line that counts

Push her to lock in the **CompTIA Academic Store** discount **while she's still enrolled** and target **Security+**. See [certs](../certs.md). Also: check whether AUM's department resells vouchers — that's often the best deal and easy to miss.

## Hosting this site

You host the repo on GitHub. To publish the site:

1. Push the repo to GitHub.
2. Repo **Settings → Pages → Source: GitHub Actions**.
3. The included workflow (`.github/workflows/deploy.yml`) builds and deploys on every push to `main`.
4. Edit `mkdocs.yml` — set `site_url` and `repo_url` to your real URLs (search for `CHANGE-ME`).

Local preview while editing:

```bash
pip install -r requirements.txt
mkdocs serve
```
