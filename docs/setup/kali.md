# Set up Kali Linux (Module 7 onward)

Around **Week 11** you graduate from the browser workspace to a real attacker operating system: **Kali Linux**. Kali ships with hundreds of security tools pre-installed. Do this with Pranith on a call the first time.

!!! warning "Only attack what you own or are authorized to test"
    Kali is powerful. Use it against **your own VMs**, **intentionally vulnerable practice targets** (Metasploitable, DVWA, Juice Shop), or platforms that explicitly invite it (TryHackMe, Hack The Box). Never point these tools at systems you don't have written permission to test — that's the legal/ethical line of the whole profession.

## Kali in VirtualBox (your Windows laptop)

Best balance of "feels real" and "safe sandbox." Your laptop is Windows, so this is the path — VirtualBox runs Kali in a window like any other app.

1. **Check you have room:** VirtualBox + Kali needs about **8 GB RAM** (4 GB minimum) and **~30 GB free disk**. If you have 8 GB RAM total it works, just close other apps.
2. Install **VirtualBox** for Windows: [virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads) → *Windows hosts*.
   - If the installer complains, you may need to enable **virtualization (VT-x/AMD-V)** in your BIOS, and turn off Windows **Hyper-V** (Pranith will help — it's a common snag).
3. Download the **Kali "Virtual Machines" → VirtualBox** prebuilt image: [kali.org/get-kali/#kali-virtual-machines](https://www.kali.org/get-kali/#kali-virtual-machines). This is the easy path — no manual OS install. It downloads as a `.7z`; extract it with [7-Zip](https://www.7-zip.org/).
4. In VirtualBox: **Add** (or double-click the `.vbox` file), then **Start** the VM.
5. Default login for prebuilt images: user `kali`, password `kali` — **change it immediately** with `passwd`.
6. Update the system:
   ```bash
   sudo apt update && sudo apt full-upgrade -y
   ```

## Practice targets on the same network

For pen-testing practice you need something to attack. Easiest: download **Metasploitable 2** (a deliberately vulnerable Linux VM) and run it alongside Kali on a **Host-Only / Internal network** in VirtualBox so it's isolated from the internet.

## Too slow? Use TryHackMe instead

If VirtualBox makes your laptop crawl (common on 8 GB RAM), **TryHackMe** gives you a Kali machine *and* targets **in the browser** — no install. You lose nothing pedagogically for this course; you can even do all of Modules 7–9 there. See [practice platforms](../ctf/platforms.md).

## Sanity check

Once Kali is up:

```bash
ip a          # what's my IP?
nmap -sn 10.0.0.0/24   # who else is on my lab network? (use YOUR subnet)
```

Then continue with [Module 7](../modules/07-pentest.md).
