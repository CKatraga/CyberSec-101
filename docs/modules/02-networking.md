# M2 · Networking <span class="week-pill">Weeks 3–4</span>

**Goal:** understand how data actually moves — IP, TCP/UDP, ports, DNS, HTTP — and scan a network. Security makes no sense without this.

*Reinforces: CSCI 6170 Advanced Network Systems.*

## 🎥 Watch

Ed Harmoush explains networking better than almost anyone. Start with his fundamentals:

<div class="yt"><iframe src="https://www.youtube.com/embed/videoseries?list=PLIFyRwBY_4bRLmKfP1KnZA6rZbRHtxmXi" title="Networking Fundamentals — Practical Networking" allowfullscreen></iframe></div>

*Networking Fundamentals — Practical Networking (Ed Harmoush).*

For one long, structured sit-down, this maps to CompTIA Network+:

<div class="yt"><iframe src="https://www.youtube.com/embed/qiQR5rTSshw" title="Computer Networking Full Course (freeCodeCamp)" allowfullscreen></iframe></div>

Prefer bite-sized, exam-aligned lessons? **[Professor Messer's Network+ (N10-009)](https://www.youtube.com/playlist?list=PLG49S3nxzAnl_tQe3kvnmeMid0mjF8Le8)** is the gold standard.

## 🛠️ Do

In your Codespace terminal, explore the network stack for real:

```bash
# DNS: turn a name into an address
dig example.com +short
nslookup aum.edu

# HTTP by hand — see the request and response
curl -v https://example.com/ 2>&1 | head -n 30

# Ports & services on a host you're allowed to scan (scanme.nmap.org is provided by Nmap for practice)
nmap -sV scanme.nmap.org

# Watch your own machine's connections
ss -tunap 2>/dev/null | head
```

Then do **subnetting** until it's automatic — Ed Harmoush's **[Subnetting Mastery](https://www.youtube.com/playlist?list=PLIFyRwBY_4bQUE4IB5c4VPRyDoLgOdExE)** playlist. Practice at [subnettingpractice.com](https://subnettingpractice.com).

## 🏁 Capture

- [ ] Explain, in your journal, what happened in each step when you ran `curl -v` (DNS → TCP handshake → TLS → HTTP).
- [ ] Run `nmap -sV scanme.nmap.org` and record which ports are open and what services/versions they run.
- [ ] Correctly subnet 3 practice problems and paste your working.

## ✅ Check-in

Walk Pranith through your `nmap` output: what's a port, what's a service version, and why an attacker cares about that version number.
