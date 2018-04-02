# base-image for node on any machine using a template variable,
# see more about dockerfile templates here: http://docs.resin.io/deployment/docker-templates/
# and about resin base images here: http://docs.resin.io/runtime/resin-base-images/
# Note the node:slim image doesn't have node-gyp

#FROM resin/%%RESIN_MACHINE_NAME%%-node:8-slim
FROM resin/raspberrypi3-alpine-node:8-slim

# Uncomment the next three lines if you want GPIO for Pi
# RUN apt-get update && apt-get install -yq \
#     rpi.gpio && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY package.json package.json

RUN JOBS=MAX npm install --production --unsafe-perm --no-optional && npm cache clean --force && rm -rf /tmp/*

COPY . ./

ENV INITSYSTEM on
ENV NODE_PATH=/usr/src/app/node_modules

EXPOSE 1880

CMD ["npm", "start"]
