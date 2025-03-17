FROM docker.io/library/node:23.9.0-slim@sha256:dcacc1ee3b03a497c2096b0084d3a67b856e777b55ffccfcc76bcdab9cc65906
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
