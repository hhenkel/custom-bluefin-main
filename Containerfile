# ==========================================
# Stage 1: Minimal Custom Base Image
# ==========================================
FROM ghcr.io/ublue-os/bluefin:stable AS base

COPY build-base.sh /tmp/build-base.sh

RUN chmod +x /tmp/build-base.sh &&\
    /tmp/build-base.sh && \
    dnf5 clean all && \
    ostree container commit
RUN bootc container lint

# ==========================================
# Stage 2: Niri Variant
# ==========================================
FROM base AS niri

COPY build-niri.sh /tmp/build-niri.sh
RUN chmod +x /tmp/build-niri.sh && \
    /tmp/build-niri.sh && \
    rm -f /tmp/build-niri.sh && \
    dnf5 clean all && \
    ostree container commit
RUN bootc container lint

# ==========================================
# Stage 3: Hyprland Variant
# ==========================================
FROM base AS hyprland

COPY build-hyprland.sh /tmp/build-hyprland.sh
RUN chmod +x /tmp/build-hyprland.sh && \
    /tmp/build-hyprland.sh && \
    rm -f /tmp/build-hyprland.sh && \
    dnf5 clean all && \
    ostree container commit
RUN bootc container lint
