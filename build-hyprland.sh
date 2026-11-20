#!/usr/bin/env bash
set -euox pipefail

dnf5 copr enable -y lionheartp/Hyprland

# Add Hyprland-specific COPRs and packages
dnf5 install -y \
    hyprland \
    waybar \
    wofi

dnf5 copr disable -y lionheartp/Hyprland
