#!/bin/bash
clear
echo
echo "Stopping current instances (if any)"
pkill -f websockify
tigervncserver -kill :1 >/dev/null 2>&1
rm -rf /tmp/.X11-unix/X1 /tmp/.X1-lock ~/.vnc/*.log
echo "================="

echo
echo "Starting noVNC"
echo
 websockify -D --web=/usr/share/novnc/ --cert=/workspaces/vnc-codespace/self.pem 6080 localhost:5901
echo
echo "================="
echo
echo "Starting VNC Server"
 vncserver :1
echo "================="
echo
echo
echo "Server started."
echo "Go to PORTS tab and click the link next to the port 6080."
echo "Then click on vnc.html"
echo