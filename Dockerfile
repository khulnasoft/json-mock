FROM docker.io/library/node:21.6.0-slim@sha256:e8a7eb273ef8a9ebc03f0ad03c0fd4bbc3562ec244691e6fc37344ee2c4357d2
RUN npm install -g json-server \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y curl iproute2 \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ADD run.sh default.json middleware.js /
ENTRYPOINT ["bash", "/run.sh"]
CMD []
