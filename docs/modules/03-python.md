# M3 · Python for Security <span class="week-pill">Week 5</span>

**Goal:** write small Python programs that automate security tasks — parse logs, talk to websites, scan ports. You don't need to become a software engineer; you need to be *dangerous enough* to build your own little tools.

*Reinforces: CSCI 6163 Python Programming Language & Lab.*

## 🎥 Watch

<div class="yt"><iframe src="https://www.youtube.com/embed/rfscVS0vtbw" title="Learn Python - Full Course for Beginners (freeCodeCamp)" allowfullscreen></iframe></div>

*Learn Python – Full Course for Beginners — freeCodeCamp.* Watch through functions, loops, files, and lists.

Prefer a gentler, university-style pace? **[Python for Everybody](https://www.youtube.com/watch?v=8DvywoWv6fI)** (Dr. Chuck) is superb. For a security spin, **[NetworkChuck's free Python course](https://www.youtube.com/playlist?list=PLIhvC56v63ILPDA2DQBv0IKzqsWTZxCkp)**.

## 🛠️ Do — build three tiny tools

Create each file in `labs/03-python/` and run it. Try to write them yourself before looking anything up.

1. **Log parser** — read the `auth.log` from Bash CTF level 5 and print every failed login IP, sorted by count.
   ```python
   from collections import Counter
   ips = Counter()
   for line in open("../01-bash/playground/level-05/auth.log"):
       if "Failed password" in line:
           ips[line.split("from ")[1].split()[0]] += 1
   for ip, n in ips.most_common(10):
       print(f"{n:4}  {ip}")
   ```
2. **Website checker** — use `requests` to fetch a URL and print its status code and server header.
3. **Port scanner** — use `socket` to check which of ports 20–100 are open on `scanme.nmap.org`. (This teaches you what `nmap` does under the hood.)

## 🏁 Capture

- [ ] All three scripts run and produce output.
- [ ] Extend the log parser to also print the *one successful* login and its session token (the flag).

## ✅ Check-in

Show Pranith your port scanner and explain the difference between an open, closed, and filtered port.
