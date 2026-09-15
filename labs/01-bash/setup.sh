#!/usr/bin/env bash
# Generates the Bash CTF playground. Safe to re-run (it rebuilds everything).
set -euo pipefail
here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
P="$here/playground"
F() { bash "$here/flag.sh" "$1"; }
rm -rf "$P"; mkdir -p "$P"
rm -f "$here/.secret"; bash "$here/flag.sh" 0 >/dev/null   # new secret

# ---- Level 00: read a file --------------------------------------------------
d="$P/level-00"; mkdir -p "$d"
cat > "$d/README" <<TXT
Welcome, Chandana! Every level hides a flag that looks like FLAG{............}.
When you find it, submit it from the labs/01-bash folder:

    ./check.sh 0 'FLAG{...}'

Level 0 flag is right here: $(F 0)
TXT

# ---- Level 01: hidden file ---------------------------------------------------
d="$P/level-01"; mkdir -p "$d"
echo "Nothing to see here. Or is there? (hint: ls has an option that shows ALL files)" > "$d/README"
echo "$(F 1)" > "$d/.hidden_flag"

# ---- Level 02: awkward filenames --------------------------------------------
d="$P/level-02"; mkdir -p "$d"
echo "Three files. Their names are annoying on purpose. (hint: quotes, and 'cat ./-' )" > "$d/README"
echo "decoy" > "$d/spaces in this name.txt"
echo "$(F 2)" > "$d/-"
echo "decoy" > "$d/--help"

# ---- Level 03: needle in haystack (file type) --------------------------------
d="$P/level-03"; mkdir -p "$d/inhere"
echo "There are 100 files in ./inhere. Only ONE is human-readable text. (hint: the 'file' command, and 'grep -r')" > "$d/README"
for i in $(seq -w 0 99); do head -c 300 /dev/urandom > "$d/inhere/file$i"; done
n=$(( RANDOM % 100 )); printf 'The flag is %s\n' "$(F 3)" > "$d/inhere/file$(printf '%02d' $n)"

# ---- Level 04: find by size --------------------------------------------------
d="$P/level-04"; mkdir -p "$d"
echo "Somewhere under ./maze is a file that is exactly 1033 bytes. (hint: find -size 1033c)" > "$d/README"
for a in $(seq 1 8); do for b in $(seq 1 6); do mkdir -p "$d/maze/dir$a/sub$b"; head -c $(( 500 + RANDOM % 900 )) /dev/urandom | base64 > "$d/maze/dir$a/sub$b/data.txt"; done; done
t="$d/maze/dir$(( 1 + RANDOM % 8 ))/sub$(( 1 + RANDOM % 6 ))/notes.txt"
python3 - "$t" "$(F 4)" <<'PY'
import sys; p, flag = sys.argv[1], sys.argv[2]
body = f"the flag is {flag}\n"; open(p,'w').write(body + 'x'*(1033-len(body)-1) + '\n')
PY

# ---- Level 05: grep a log ----------------------------------------------------
d="$P/level-05"; mkdir -p "$d"
echo "auth.log has 5000 lines. Find the line where user 'chandana' logged in successfully from 10.0.0.77. (hint: grep, and grep -o)" > "$d/README"
python3 - "$d/auth.log" "$(F 5)" <<'PY'
import sys, random
p, flag = sys.argv[1], sys.argv[2]
users=['root','admin','alice','bob','chandana','pranith','svc_backup']
lines=[]
for i in range(5000):
    u=random.choice(users); ip=f"10.0.{random.randint(0,3)}.{random.randint(1,254)}"
    if random.random()<0.8: lines.append(f"Sep {random.randint(1,30):02d} 0{random.randint(0,9)}:{random.randint(10,59)}:{random.randint(10,59)} host sshd[{random.randint(1000,9999)}]: Failed password for {u} from {ip} port {random.randint(30000,60000)} ssh2")
    else: lines.append(f"Sep {random.randint(1,30):02d} 0{random.randint(0,9)}:{random.randint(10,59)}:{random.randint(10,59)} host sshd[{random.randint(1000,9999)}]: Accepted password for {u} from {ip} port {random.randint(30000,60000)} ssh2")
lines[random.randint(100,4900)] = f"Sep 14 03:21:07 host sshd[4242]: Accepted password for chandana from 10.0.0.77 port 51234 ssh2 session-token={flag}"
open(p,'w').write('\n'.join(lines)+'\n')
PY

# ---- Level 06: base64 ---------------------------------------------------------
d="$P/level-06"; mkdir -p "$d"
echo "data.txt is encoded. It is NOT encrypted. (hint: base64 -d)" > "$d/README"
printf 'Well done, the flag is %s\n' "$(F 6)" | base64 > "$d/data.txt"

# ---- Level 07: rot13 ----------------------------------------------------------
d="$P/level-07"; mkdir -p "$d"
echo "data.txt was 'encrypted' with a Caesar shift of 13 (ROT13). (hint: tr 'A-Za-z' 'N-ZA-Mn-za-m')" > "$d/README"
printf 'Gur synt vf %s\n' "$(F 7 | tr 'A-Za-z' 'N-ZA-Mn-za-m')" > "$d/data.txt"

# ---- Level 08: permissions ----------------------------------------------------
d="$P/level-08"; mkdir -p "$d"
echo "locked.txt refuses to open. You own it, so you can change that. (hint: ls -l, chmod)" > "$d/README"
echo "$(F 8)" > "$d/locked.txt"; chmod 000 "$d/locked.txt"

# ---- Level 09: unique line ----------------------------------------------------
d="$P/level-09"; mkdir -p "$d"
echo "data.txt has 1000 lines. Every line appears more than once, except ONE. (hint: sort | uniq -u)" > "$d/README"
python3 - "$d/data.txt" "$(F 9)" <<'PY'
import sys, random, hashlib
p, flag = sys.argv[1], sys.argv[2]
words=[hashlib.md5(str(i).encode()).hexdigest() for i in range(300)]
lines=[random.choice(words) for _ in range(999)]
for w in set(lines):
    if lines.count(w)==1: lines.append(w)
lines.append(flag); random.shuffle(lines); open(p,'w').write('\n'.join(lines)+'\n')
PY

# ---- Level 10: nested archives ------------------------------------------------
d="$P/level-10"; mkdir -p "$d"; tmp=$(mktemp -d)
echo "$(F 10)" > "$tmp/flag.txt"
( cd "$tmp" && tar czf inner.tgz flag.txt && bzip2 -k inner.tgz && tar cf outer.tar inner.tgz.bz2 && gzip outer.tar )
mv "$tmp/outer.tar.gz" "$d/package.bin"; rm -rf "$tmp"
echo "package.bin is an archive inside an archive inside... (hint: 'file package.bin' tells you what it REALLY is; repeat)" > "$d/README"

# ---- Level 11: strings in a binary -------------------------------------------
d="$P/level-11"; mkdir -p "$d"
echo "program is a compiled-looking blob. The flag is inside it as text. (hint: strings | grep)" > "$d/README"
{ head -c 4000 /dev/urandom; printf 'secret=%s' "$(F 11)"; head -c 4000 /dev/urandom; } > "$d/program"

# ---- Level 12: talk to a network service -------------------------------------
d="$P/level-12"; mkdir -p "$d"
cat > "$d/README" <<TXT
Start the tiny web service in another terminal:

    python3 playground/level-12/server.py

Then, from your first terminal, talk to it with curl (and try nc too):

    curl http://localhost:8081/
TXT
python3 - "$d/server.py" "$(F 12)" <<'PY'
import sys; p, flag = sys.argv[1], sys.argv[2]
open(p,'w').write(f'''from http.server import BaseHTTPRequestHandler, HTTPServer
FLAG = "{flag}"
class H(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/flag" and self.headers.get("X-Learner") == "chandana":
            body = ("Congratulations! " + FLAG + "\\n").encode()
        elif self.path == "/flag":
            body = b"Almost. Send the HTTP header  X-Learner: chandana  (hint: curl -H)\\n"
        else:
            body = b"Hello! Try GET /flag\\n"
        self.send_response(200); self.send_header("Content-Type","text/plain"); self.end_headers(); self.wfile.write(body)
print("Serving on http://localhost:8081  (Ctrl+C to stop)")
HTTPServer(("127.0.0.1", 8081), H).serve_forever()
''')
PY

echo "Playground ready at $P  (start with: cat playground/level-00/README)"
