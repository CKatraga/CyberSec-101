# M6 · Web Security <span class="week-pill">Weeks 9–10</span>

**Goal:** understand and exploit the **OWASP Top 10** web vulnerabilities — SQL injection, XSS, broken access control — using Burp Suite against apps that are *made* to be hacked. This is where cybersecurity starts to feel like the movies.

*Reinforces: CSIS 6020 Ethical Hacking (web portion). Builds on your DVWA lab (Report 4).*

## 🎥 Watch

Rana Khalil (OSCP) walks through the free **PortSwigger Web Security Academy** labs one by one. Start with the two most important classes of bug:

<div class="yt"><iframe src="https://www.youtube.com/embed/videoseries?list=PLuyTk2_mYISLaZC4fVqDuW_hOk0dd5rlf" title="Web Security Academy - SQL Injection — Rana Khalil" allowfullscreen></iframe></div>

*SQL Injection (long version) — Rana Khalil.* Then her **[Broken Access Control](https://www.youtube.com/playlist?list=PLuyTk2_mYISId4_l9YET7Gv29cHcNguq-)** and **[Authentication](https://www.youtube.com/playlist?list=PLuyTk2_mYISJmmOLYzGxVSwS5vAhBVphr)** playlists.

## 🛠️ Do — hack Juice Shop

**OWASP Juice Shop** is a full, deliberately-vulnerable web app with built-in challenges and a scoreboard. Run it in your Codespace:

```bash
docker run --rm -p 3000:3000 bkimminich/juice-shop
```

Open the forwarded **port 3000**. Find the hidden **Score Board** (that's challenge #1), then work up from the trivial challenges. Use your browser's DevTools first; add **Burp Suite Community** when you move to Kali.

Also revisit **DVWA** (you used it in your AUM Report 4) and set it to "low", then "medium" security to feel the difference a fix makes.

### Then: the real PortSwigger labs (free)

Create a free account at **[portswigger.net/web-security](https://portswigger.net/web-security)** and do the **Apprentice**-level labs for SQL injection and access control, following Rana Khalil's videos when stuck.

## 🏁 Capture

- [ ] Find the Juice Shop Score Board and solve **at least 6** challenges (screenshot the scoreboard).
- [ ] Complete **3 PortSwigger Apprentice labs** and note the payload that worked for each.
- [ ] In your journal, explain in one line each: how SQLi works, and the one-line *fix* (parameterized queries).

## ✅ Check-in

Demo one live SQL injection to Pranith and explain both the attack and the defense.
