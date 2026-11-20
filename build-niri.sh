#!/usr/bin/env bash
set -euox pipefail

# Add Niri-specific COPRs and packages
dnf5 install -y \
    niri \
    waybar \
    fuzzel
