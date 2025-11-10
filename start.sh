#!/bin/bash

echo
echo "starting noVNC"
 websockify -D --web=/usr/share/novnc/ --cert=/workspaces/vnc-codespace/self.pem 6080 localhost:5901
echo "================="
echo
echo "starting VNC Server"
 vncserver :1
echo "================="
echo
echo
echo "Server started."
echo "Go to PORTS tab and click the link next to the port 6080."
echo "Then click on vnc.html"
echo