FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Paris

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl docker.io git iputils-ping jq nano netcat-openbsd nodejs npm openssh-server python3 python3-pip rsync smbclient sudo ttyd tzdata \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g @openai/codex

RUN useradd -m -s /bin/bash abc \
    && mkdir -p /config /workspace /run/sshd \
    && chown -R abc:abc /config /workspace \
    && echo "abc ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/abc

WORKDIR /workspace

COPY rootfs/ /
RUN chmod +x /usr/local/bin/start-workspace /etc/services.d/web/run /etc/services.d/ssh/run

EXPOSE 8088 2222
VOLUME ["/config", "/workspace"]

CMD ["/usr/local/bin/start-workspace"]
