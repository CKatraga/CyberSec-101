# M8 · Network Security & Wireshark <span class="week-pill">Week 13</span>

**Goal:** read network traffic like a defender — capture packets in Wireshark, spot a scan and a plaintext-credential leak, and understand firewalls, IDS/IPS, and man-in-the-middle attacks.

*Reinforces: CSIS 6013 Network Security & Reliability; your MITM & DNS labs (Report 7). Builds on your Wireshark lab.*

## 🎥 Watch

Chris Greer is *the* Wireshark teacher. Start here:

<div class="yt"><iframe src="https://www.youtube.com/embed/OU-A2EmVrKQ" title="Learn Wireshark - Tutorial for Beginners — Chris Greer" allowfullscreen></iframe></div>

Then work through his **[Wireshark Masterclass](https://www.youtube.com/playlist?list=PLW8bTPfXNGdC5Co0VnBK1yVzAwSSphzpJ)** and, for defenders, **[Wireshark for Cybersecurity & Threat Hunting](https://www.youtube.com/playlist?list=PLW8bTPfXNGdAY3AfCNtm12Ogzryfs7Ket)**.

## 🛠️ Do — capture and hunt

In Kali (or your Codespace with `tshark`):

```bash
# Capture traffic while you browse to an HTTP (not HTTPS) site
sudo tcpdump -i any -w capture.pcap &   # or use the Wireshark GUI in Kali
curl http://example.com/
kill %1

# Read it back and find the HTTP request
tshark -r capture.pcap -Y "http.request" -T fields -e ip.dst -e http.host -e http.request.uri
```

Then, in the Wireshark GUI:

1. Capture your own traffic, apply the display filter `http`, and **follow an HTTP stream**.
2. Do a plaintext login on a lab app (DVWA) and **find the username/password in the capture** — this is *why* HTTPS matters.
3. Run an `nmap` scan against a lab target while capturing, and learn to **recognize what a port scan looks like** on the wire.

Grab practice captures from the **[Wireshark sample-captures wiki](https://wiki.wireshark.org/SampleCaptures)** and hunt through them.

## 🏁 Capture

- [ ] A `.pcap` where you located credentials sent in the clear (screenshot the "Follow Stream").
- [ ] Identify, in a capture, the packets that reveal an nmap SYN scan; explain the tell.
- [ ] One paragraph: how a firewall, an IDS, and an IPS differ.

## ✅ Check-in

Show Pranith the captured plaintext password and explain what TLS would have changed.
