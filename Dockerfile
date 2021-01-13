FROM node:10-alpine

RUN apk --no-cache add git
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package.json ./
COPY yarn.lock ./

USER node

RUN yarn

COPY --chown=node:node . .

EXPOSE 5000

CMD [ "node", "index.js" ]