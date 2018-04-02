# base-image for node on any machine using a template variable,
# Note the node:slim image doesn't have node-gyp
FROM node:8-slim

WORKDIR /usr/src/app

COPY package.json package.json

RUN JOBS=MAX npm install --production --unsafe-perm --no-optional && npm cache clean --force && rm -rf /tmp/*

COPY . ./

ENV HOST_IP=172.17.0.1
ENV NODE_PATH=/usr/src/app/node_modules

EXPOSE 1880

CMD ["npm", "start"]
