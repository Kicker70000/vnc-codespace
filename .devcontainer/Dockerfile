# Minimal devcontainer image that installs a lightweight KDE Plasma session,
# TigerVNC for the VNC server and noVNC (websockify) as a web client.
FROM mcr.microsoft.com/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    git \
    curl \
    python3-pip \
    tigervnc-standalone-server \
    dbus-x11 \
    x11-utils \
    x11-xserver-utils \
    plasma-desktop \
    plasma-workspace \
    kde-baseapps \
    xdg-utils \
    supervisor \
  && pip3 install --no-cache-dir websockify \
  && git clone https://github.com/novnc/noVNC.git /opt/noVNC \
  && git clone https://github.com/novnc/websockify /opt/websockify \
  && ln -s /opt/noVNC/utils/novnc_proxy.py /usr/local/bin/novnc_proxy || true \
  && chmod +x /usr/local/bin/novnc_proxy || true \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Copy local start script into image
COPY start-desktop.sh /usr/local/bin/start-desktop.sh
RUN chmod +x /usr/local/bin/start-desktop.sh

ENV VNC_PASSWORD=vscode

EXPOSE 5901 6080

CMD ["/bin/bash"]
