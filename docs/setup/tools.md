# Tools cheat-sheet

Your one-page reference. Bookmark it. Copy commands here into your journal as you learn them.

## Navigating & files
| Command | Does |
|---|---|
| `pwd` | where am I |
| `ls -la` | list all files, incl. hidden, with details |
| `cd dir` / `cd ..` | change directory / go up |
| `cat file` / `less file` | show a file / page through it |
| `head -n 20 file` / `tail -f log` | first 20 lines / follow a growing log |
| `find . -name "*.txt" -size 1033c` | find files by name/size |
| `grep -r -i "text" .` | search recursively, case-insensitive |
| `chmod +x script.sh` / `chmod 400 f` | make executable / owner-read-only |

## Text wrangling
| Command | Does |
|---|---|
| `wc -l file` | count lines |
| `sort file \| uniq -c` | count duplicates |
| `sort \| uniq -u` | keep only lines that appear once |
| `cut -d: -f1 /etc/passwd` | slice columns by delimiter |
| `awk '{print $1}'` / `sed 's/a/b/g'` | column extract / find-replace |
| `tr 'A-Za-z' 'N-ZA-Mn-za-m'` | ROT13 |

## Encoding & crypto
| Command | Does |
|---|---|
| `base64 file` / `base64 -d file` | encode / decode |
| `md5sum file` / `sha256sum file` | hashes |
| `openssl enc -aes-256-cbc -in f -out f.enc` | encrypt a file |
| `openssl rand -hex 16` | random key/token |

## Networking
| Command | Does |
|---|---|
| `ip a` | my IP addresses |
| `ping host` / `traceroute host` | reachability / path |
| `dig example.com` / `nslookup` | DNS lookups |
| `curl -v http://host/` | make an HTTP request, verbose |
| `curl -H "X-Foo: bar" url` | send a custom header |
| `nc -lvnp 4444` / `nc host 80` | listen / connect (netcat) |
| `nmap -sV -sC target` | scan ports, versions, default scripts |
| `tshark -r capture.pcap` | read a packet capture |

## Git (save your work)
| Command | Does |
|---|---|
| `git status` | what changed |
| `git add -A` | stage everything |
| `git commit -m "message"` | save a snapshot |
| `git push` | upload to GitHub |

!!! tip
    Don't try to memorize these. You'll remember the 20 you use every week, and look up the rest. That's exactly how professionals work.
