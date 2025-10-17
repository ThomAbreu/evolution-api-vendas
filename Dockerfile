FROM node:20-alpine

WORKDIR /evolution

RUN apk add --no-cache git

RUN git clone https://github.com/EvolutionAPI/evolution-api.git . && \
    npm ci --only=production

EXPOSE 8080

CMD ["node", "./dist/src/main.js"]
