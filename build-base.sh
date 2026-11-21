#!/usr/bin/env bash
set -euox pipefail


tee /etc/yum.repos.d/netbird.repo <<EOF
[netbird]
name=netbird
baseurl=https://pkgs.netbird.io/yum/
enabled=1
gpgcheck=0
gpgkey=https://pkgs.netbird.io/yum/repodata/repomd.xml.key
repo_gpgcheck=1
EOF

rpm-ostree install netbird-ui


RUN mkdir -p /nix && \
    chmod +x /usr/libexec/setup-nix-subvol.sh && \
    systemctl enable nix-subvol-setup.service

