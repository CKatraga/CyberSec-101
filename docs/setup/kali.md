# Set up Kali Linux (Module 7 onward)

Around **Week 11** you graduate from the browser workspace to a real attacker operating system: **Kali Linux**. Kali ships with hundreds of security tools pre-installed. Do this with Pranith on a call the first time.

!!! warning "Only attack what you own or are authorized to test"
    Kali is powerful. Use it against **your own VMs**, **intentionally vulnerable practice targets** (Metasploitable, DVWA, Juice Shop), or platforms that explicitly invite it (TryHackMe, Hack The Box). Never point these tools at systems you don't have written permission to test — that's the legal/ethical line of the whole profession.

## Option A — Kali in VirtualBox (recommended, free)

Best balance of "feels real" and "safe sandbox."

1. Install **VirtualBox**: [virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads).
2. Download the **Kali "Virtual Machines" (VirtualBox) prebuilt image**: [kali.org/get-kali/#kali-virtual-machines](https://www.kali.org/get-kali/#kali-virtual-machines). This is the easy path — no manual install.
3. Import the `.ova` / extract the archive, start the VM.
4. Default login for prebuilt images: user `kali`, password `kali` — **change it immediately** with `passwd`.
5. Update the system:
   ```bash
   sudo apt update && sudo apt full-upgrade -y
   ```

!!! note "Apple Silicon Mac (M1/M2/M3)?"
    VirtualBox support is limited on Apple Silicon. Use **UTM** ([mac.getutm.app](https://mac.getutm.app)) with the Kali **Apple Silicon (ARM64)** image from the Kali downloads page instead. Tell Pranith which laptop you have and he'll pick the right path.

## Option B — Practice targets on the same network

For pen-testing practice you need something to attack. Easiest: download **Metasploitable 2** (a deliberately vulnerable Linux VM) and run it alongside Kali on a **Host-Only / Internal network** in VirtualBox so it's isolated from the internet.

## Option C — Skip local install, use TryHackMe

If your laptop is too weak for VMs, **TryHackMe** gives you a Kali machine *and* targets in the browser. You lose nothing pedagogically for this course. See [practice platforms](../ctf/platforms.md).

## Sanity check

Once Kali is up:

```bash
ip a          # what's my IP?
nmap -sn 10.0.0.0/24   # who else is on my lab network? (use YOUR subnet)
```

Then continue with [Module 7](../modules/07-pentest.md).
