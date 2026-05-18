FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Paris

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl git jq nano openssh-server python3 python3-pip rsync smbclient sudo tzdata \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash abc \
    && mkdir -p /config /workspace /run/sshd \
    && chown -R abc:abc /config /workspace

WORKDIR /workspace

COPY rootfs/ /
RUN chmod +x /usr/local/bin/start-workspace /etc/services.d/web/run /etc/services.d/ssh/run

EXPOSE 8088 2222
VOLUME ["/config", "/workspace"]

CMD ["/usr/local/bin/start-workspace"]
