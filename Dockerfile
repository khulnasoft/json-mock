FROM docker.io/library/node:24.0.0-slim@sha256:7b0f9cbb3f88da0e67873be5efcf38ce79ea25cfbb4986fad55a446af484e7c9
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
