FROM docker.io/library/node:21.3.0-slim@sha256:8d66ff8ac7f7053d707de87bc86ebfe8b4052e4fc8a9d3195e8f8441a247bd70
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
