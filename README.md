# Chandana's Cyber Path

A visual, hands-on cybersecurity course for Chandana (final-semester MS Cybersecurity, AUM), built as a static MkDocs site with in-repo labs and a Bash CTF.

- **Course site:** built from `docs/` with **MkDocs Material**, auto-deployed to GitHub Pages.
- **Labs:** `labs/` — self-contained, run in GitHub Codespaces (first half) then Kali (second half).
- **Learning loop:** watch a short video → do the lab → capture a flag → journal → mentor check-in.

## Run locally

```bash
pip install -r requirements.txt
mkdocs serve
```

## Run the Bash CTF

```bash
cd labs/01-bash && ./setup.sh && cat playground/level-00/README
```

## Publish (one-time)

1. Push to GitHub.
2. Settings → Pages → Source: **GitHub Actions**.
3. In `mkdocs.yml`, replace every `CHANGE-ME` with your GitHub username/repo.

## For the mentor

See **docs/mentor/guide.md** (also on the published site under *Mentor*).
