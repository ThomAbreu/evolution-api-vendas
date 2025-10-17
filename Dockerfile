FROM node:20-alpine

WORKDIR /evolution

RUN apk add --no-cache git

RUN git clone https://github.com/EvolutionAPI/evolution-api.git .

RUN npm install --legacy-peer-deps

RUN npm run build

EXPOSE 8080

CMD ["node", "./dist/src/main.js"]
