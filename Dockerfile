# FROM ubuntu:16.04
# RUN apt-get update && apt-get install -y \
#    curl \
# && curl -sL https://deb.nodesource.com/setup_7.x | bash - \
# && apt-get update  \
# && apt-get install -y nodejs

FROM node:18-alpine
ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --production

COPY . .

CMD [ "node", "server.js" ]
