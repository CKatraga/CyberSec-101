# M9 · Malware Analysis & Digital Forensics <span class="week-pill">Week 14</span>

**Goal:** safely triage a suspicious file, understand basic static vs. dynamic malware analysis, and investigate a host using Windows forensic artifacts and logs.

*Reinforces: CSIS 6080 Malware Analysis & Digital Forensics; your log-analysis lab (Report 12).*

!!! danger "Handle malware safely"
    Only detonate malware inside an **isolated VM with no network** (or a host-only network) and take a **snapshot** first. Never run samples on your real machine.

## 🎥 Watch

**Malware triage** — the first 5+ hours of TCM's *Practical Malware Analysis & Triage* by HuskyHacks are on YouTube; John Hammond's channel is also a goldmine:

<div class="yt"><iframe src="https://www.youtube.com/embed/videoseries?list=PLlv3b9B16ZafLdkYgJTR5jRQdY9CJJtTZ" title="Introduction to Malware Analysis — 13Cubed" allowfullscreen></iframe></div>

*Introduction to Malware Analysis — 13Cubed.*

**Digital forensics** — 13Cubed's methodical DFIR series:

<div class="yt"><iframe src="https://www.youtube.com/embed/videoseries?list=PLlv3b9B16ZadqDQH0lTRO4kqn2P1g9Mve" title="Introduction to Windows Forensics — 13Cubed" allowfullscreen></iframe></div>

For hands-on CTF-style reversing, **[John Hammond's Malware playlist](https://www.youtube.com/playlist?list=PL1H1sBF1VAKWMn_3QPddayIypbbITTGZv)**.

## 🛠️ Do — basic static triage

You can do *static* analysis (no execution) safely, even in your Codespace:

```bash
# What is this file, really?
file suspicious.bin
# Human-readable text hidden inside (URLs, IPs, commands)
strings suspicious.bin | grep -Ei "http|\.exe|cmd|powershell|[0-9]{1,3}(\.[0-9]{1,3}){3}"
# Hash it and look it up on VirusTotal (never upload someone else's private data)
sha256sum suspicious.bin
# Metadata of documents/images
exiftool photo.jpg
```

Then a **log investigation** (like your AUM Report 12): take an `auth.log` (reuse Bash CTF level 5) and reconstruct an incident — who logged in, from where, when, and what was unusual.

For a full lab, do **TryHackMe's "Intro to Digital Forensics"** and **"Windows Forensics 1"** rooms.

## 🏁 Capture

- [ ] Static-triage a file: report its type, notable strings, and hash.
- [ ] Write a one-page **incident timeline** from a log file (like a mini Report 12).
- [ ] Complete one forensics room; save the badge.

## ✅ Check-in

Present your incident timeline to Pranith as if he's your manager: what happened, how you know, what you'd do next.
