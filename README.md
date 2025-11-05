# noVNC Codepsace with cinnamon
> [!CAUTION]
> Since github codespaces are like docker containers, snap will not work, so you may have to install many applications manually by their .deb files.

> [!CAUTION]
> chromium is very unstable, so applications that rely on it will crash. Please use firefox (sorry).

> [!NOTE]
> Codespace may automaticly shutdown if you do not interact with the terminal for about 30 minutes, even if you are actively using VNC.

use `setup.sh` to install software and `start.sh` to start the vnc.

## setup
1. Create the codespace
   - Click the green `Code` button at the top right
   - Click on the `Codespaces` tab
   - Click on `...` and click `Create with options...`
   - If you wanna upgrade your machine type do that, otherwise click `Create codespace`

> [!TIP]
> you can upgrade your machine later by going back to the codespaces tab, press the ... next to the codespace you created and press change machine type.

> [!CAUTION]
> The codespace will be AUTOMATICALLY DELETED if you don't go back to the codepsaces tab, press ... next to the codespace you created and make sure auto-delete codespace is UNCHECKED! 
  
btw you might wanna open with visual studio cus it allows you access the vnc without making it public. to do that go back to the codespaces tab, press the ... next to the codespace you created and press open with visual studio.

2. Install server
   - If the terminal is not showing press ctrl + `
   - In the terminal type `./setup.sh` and press enter
   - Please wait until the process finishes, it will take a while.
   - When done, it will ask you to create a password to connect to the VNC. Don't worry if your input isnt appearing, Linux hides it for security.
3. Start VNC instance
   - In the terminal type `./start.sh`. This script will start the server for you. Please run this command anytime you turn on the codespace.
   - Once the server is started go to `http://127.0.0.1:6080/vnc.html` in your browser.
   - If that refused to connect, you're probably not using visual studio. That's ok! In the terminal, at the top navigation bar, click `PORTS`. Locate port number `6080` and click on its forwarded address.
4. Make the server public (optional, probably a bad idea)
   - In the terminal, at the top navigation bar, click `PORTS`
   - right click each port, click `Port Visibility`, click `Public`.
