FROM node:20-alpine

WORKDIR /evolution

RUN apk add --no-cache git curl

RUN git clone https://github.com/EvolutionAPI/evolution-api.git . && \
    npm install

EXPOSE 8080

CMD ["npm", "run", "start:prod"]
