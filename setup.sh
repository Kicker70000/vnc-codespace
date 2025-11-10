#!/bin/bash

echo
echo  "STEP 1: Update"
echo
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
echo
echo "step 1 done."
echo =================================

echo
echo  "STEP 2: Install core software"
echo
sudo apt install cinnamon-desktop-environment novnc tigervnc-standalone-server -y
echo
echo "step 2 done."
echo =================================

echo
echo  "STEP 3: Install Firefox"
echo
sudo install -d -m 0755 /etc/apt/keyrings
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}'
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
echo ' \
Package: * \
Pin: origin packages.mozilla.org \
Pin-Priority: 1000 \
' | sudo tee /etc/apt/preferences.d/mozilla 
sudo apt update && sudo apt install firefox -y
sudo apt autoremove -y
echo
echo "step 3 done."
echo =================================

echo
echo  "STEP 4: Instruct the VNC server to use cinnamon"
echo
mv /workspaces/vnc-codespace/xstartup ~/.vnc
chmod +x ~/.vnc/xstartup
echo
echo "step 4 done."
echo =================================

echo 
echo  "STEP 5: Set VNC Password"
echo
echo  "DO NOT SET A VIEW ONLY PASSWORD UNLESS YOU KNOW WHAT YOU'RE DOING!"
echo  "Type n and press enter when asked."
echo
vncpasswd 
echo
echo "step 5 done."
echo =================================

echo
echo "Finished. Please type ./start.sh to start your VNC"
echo
