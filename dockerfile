FROM node:carbon-alpine

WORKDIR /usr/src/app

COPY package*.json ./
COPY package-lock.json ./

ENV DB_NAME sql_test_db
ENV DB_USER root
ENV DB_PASS root
ENV DB_PORT 1433
ENV DB_HOST 172.0.0.1
ENV MAX_POOL 10
ENV MIN_POOL 1

RUN npm i

COPY ./dist .

EXPOSE 3000

CMD [ "npm", "start" ]
