# M5 · Cryptography <span class="week-pill">Week 8</span>

**Goal:** understand hashing, symmetric vs. asymmetric encryption, digital signatures, and how TLS protects your browsing — then use OpenSSL to do it yourself. You already did an AES/RSA lab at AUM; this makes the *why* click.

*Reinforces: CSIS 6040 Cryptography (your Report 3 AES/RSA lab).*

## 🎥 Watch

Start with the clearest 20 minutes on public-key crypto ever made:

<div class="yt"><iframe src="https://www.youtube.com/embed/GSIDS_lvRv4" title="Public Key Cryptography - Computerphile" allowfullscreen></iframe></div>

Then Ed Harmoush's visual **Cryptography Essentials** and **Practical TLS**:

<div class="yt"><iframe src="https://www.youtube.com/embed/videoseries?list=PLIFyRwBY_4bQvq5PuJASilkHSVGLZtceZ" title="Cryptography Essentials — Practical Networking" allowfullscreen></iframe></div>

For depth (the real thing, university level), **[Christof Paar's Introduction to Cryptography](https://www.youtube.com/playlist?list=PL6N5qY2nvvJE8X75VkXglSrVhLv1tVcfy)** — pick the lectures that match your AUM syllabus.

## 🛠️ Do — crypto with your own hands (OpenSSL)

```bash
# Hashing: same input -> same hash; tiny change -> totally different hash
echo -n "chandana" | sha256sum
echo -n "chandanb" | sha256sum      # compare!

# Symmetric encryption (one shared password)
echo "meet me at the library" > secret.txt
openssl enc -aes-256-cbc -pbkdf2 -salt -in secret.txt -out secret.enc
openssl enc -aes-256-cbc -pbkdf2 -d  -in secret.enc  -out out.txt
cat out.txt

# Asymmetric: make a key pair, encrypt with public, decrypt with private
openssl genrsa -out private.pem 2048
openssl rsa -in private.pem -pubout -out public.pem
echo "top secret" | openssl pkeyutl -encrypt -pubin -inkey public.pem -out msg.enc
openssl pkeyutl -decrypt -inkey private.pem -in msg.enc

# Inspect the certificate of a real website (TLS in action)
echo | openssl s_client -connect example.com:443 2>/dev/null | openssl x509 -noout -issuer -subject -dates
```

**Crack a weak hash** (why salting matters): put a few common-password MD5 hashes in a file and run `john`:
```bash
john --format=raw-md5 hashes.txt
```

## 🏁 Capture

- [ ] Encrypt and decrypt a file with AES; explain why you must share the password *out of band*.
- [ ] Generate an RSA key pair and explain, in your journal, which key you'd give to the world and why.
- [ ] Read a real site's certificate and note who issued it and when it expires.

## ✅ Check-in

Explain to Pranith: hashing vs. encryption vs. encoding — and why passwords should be *hashed and salted*, never encrypted.
