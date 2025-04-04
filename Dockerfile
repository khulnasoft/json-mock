FROM docker.io/library/node:23.11.0-slim@sha256:f2cf744a59dcdd05b354754704a527de9fb0c5d8e924b0fc3628dedc23573c39
RUN npm install -g json-server@v0.17.4 \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y curl iproute2 \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ADD run.sh default.json middleware.js /
ENTRYPOINT ["bash", "/run.sh"]
CMD []
