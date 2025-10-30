#!/usr/bin/env bash
set -euo pipefail

# Start script for KDE Plasma via TigerVNC and noVNC. Intended to be run inside
# the Codespaces devcontainer (as the 'vscode' user via postStartCommand).

VNC_PASS="${VNC_PASSWORD:-vscode}"
HOME_DIR="/home/vscode"

echo "[noVNC setup] Using VNC password: (hidden)"

mkdir -p "$HOME_DIR/.vnc"
echo "$VNC_PASS" | vncpasswd -f > "$HOME_DIR/.vnc/passwd"
chmod 600 "$HOME_DIR/.vnc/passwd"
chown -R vscode:vscode "$HOME_DIR/.vnc"

cat > "$HOME_DIR/.vnc/xstartup" <<'XSTART'
#!/bin/sh
export XDG_RUNTIME_DIR=/run/user/1000
unset DBUS_SESSION_BUS_ADDRESS
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
export DISPLAY=:1
exec dbus-launch --exit-with-session startplasma-x11
XSTART

chmod +x "$HOME_DIR/.vnc/xstartup"
chown vscode:vscode "$HOME_DIR/.vnc/xstartup"

echo "[noVNC setup] Killing any existing VNC session on :1"
vncserver -kill :1 >/dev/null 2>&1 || true

echo "[noVNC setup] Starting vncserver :1"
vncserver :1 -geometry 1280x800 -depth 24

if [ -d /opt/noVNC ]; then
  echo "[noVNC setup] Starting noVNC proxy on port 6080 -> vnc localhost:5901"
  # use bundled novnc proxy script
  /usr/local/bin/novnc_proxy --vnc localhost:5901 --listen 6080 &>/tmp/novnc.log &
  echo "[noVNC setup] noVNC proxy started (logs -> /tmp/novnc.log)"
else
  echo "[noVNC setup] noVNC not found in /opt/noVNC; to use noVNC clone https://github.com/novnc/noVNC into /opt/noVNC"
fi

echo "[noVNC setup] Desktop should be available on port 6080. If you're in Codespaces, use the forwarded port (Web Preview)."
