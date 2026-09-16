# Learning workspace for GitHub Codespaces / Ona (formerly Gitpod).
# Everything here is installable inside a container: no GUI, no raw-socket tricks needed.
FROM mcr.microsoft.com/devcontainers/python:3.12

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    # core shell tools
    vim nano less tree jq bc file unzip bzip2 xz-utils \
    # networking
    nmap netcat-openbsd tcpdump tshark iproute2 dnsutils whois traceroute curl wget \
    # crypto / password
    openssl john hashcat \
    # misc security utilities
    binutils exiftool sqlite3 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Let non-root user capture on interfaces with tshark/tcpdump
RUN setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap || true \
 && setcap cap_net_raw,cap_net_admin=eip /usr/bin/nmap || true

USER vscode
RUN pip install --no-cache-dir --user mkdocs-material pytest scapy requests pwntools 2>/dev/null || \
    pip install --no-cache-dir --user mkdocs-material pytest scapy requests
