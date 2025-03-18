FROM docker.io/library/node:23.10.0-slim@sha256:b89d748ea010f4d276c9d45c750fa5f371cef3fcc7486f739f07e5aad1b998a8
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
