# noVNC + KDE Plasma in GitHub Codespaces (lightweight guide)

This repository contains a ready-to-use Dev Container configuration to run a lightweight KDE Plasma desktop inside a GitHub Codespace and expose it through noVNC (web VNC) on port 6080.

What you get
- A devcontainer that installs a minimal KDE Plasma session and TigerVNC.
- noVNC (websockify) runs and proxies the VNC server to port 6080 so you can open the desktop in your browser.

Quick start
1. Push this repository to GitHub (if not already there).
2. Open the repository in GitHub Codespaces (or open it in VS Code and "Open in Codespace").
3. Codespaces will build the devcontainer (this may take several minutes and the image is fairly large).
4. After the container starts, the postStartCommand runs the desktop startup script. The web UI will be available on the forwarded port 6080. In the Codespaces UI choose "Ports" and open the forwarded port 6080 (or use the Web Preview / browser link).

Defaults
- VNC web port: 6080
- VNC display: :1 (VNC tcp port 5901 inside the container)
- Default VNC password: "vscode"

Change the default password
You can change the VNC password by setting the VNC_PASSWORD environment variable. Edit `.devcontainer/devcontainer.json` and add something like:

{
  "remoteEnv": {
    "VNC_PASSWORD": "your-secret-password"
  }
}

Notes & Troubleshooting
- Build size: KDE Plasma packages increase the image size. If you need a smaller image, consider using LXQt or XFCE instead of Plasma.
- If you don't see the desktop, check the VNC logs in the Codespace terminal:

  - ~/.vnc/*.log
  - /tmp/novnc.log

- To manually restart the desktop from a container terminal run:

  /usr/local/bin/start-desktop.sh

- If the noVNC web UI doesn't connect, ensure port 6080 is forwarded in the Codespaces Ports panel.

Security
- This setup is intended for development in GitHub Codespaces where the container is isolated and port forwarding is controlled. Do not expose this container publicly without additional authentication.

Optional improvements
- Use a lighter desktop environment (LXQt / XFCE / Openbox) for faster startup and smaller images.
- Use systemd or supervisord to manage the VNC and noVNC processes.
- Add TLS for the web proxy (novnc supports TLS) and a sturdier authentication method.

Files of interest
- `.devcontainer/Dockerfile` — container build instructions.
- `.devcontainer/devcontainer.json` — Codespaces/devcontainer configuration.
- `.devcontainer/start-desktop.sh` — startup script that creates the VNC session and runs the noVNC proxy.

If you'd like, I can:
- Replace KDE with a much lighter DE (LXQt/XFCE) and provide a smaller Dockerfile.
- Add a supervised service setup so the desktop starts/restarts automatically.
- Add an option to pre-install GUI apps you want (browser, code editor GUI, etc.).
