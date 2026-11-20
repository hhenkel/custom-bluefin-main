#!/usr/bin/env bash
set -euox pipefail

# Add Hyprland-specific COPRs and packages
dnf5 install -y \
    hyprland \
    waybar \
    wofi
