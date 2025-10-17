FROM node:20-alpine

WORKDIR /evolution

RUN apk add --no-cache git curl

# Clonar versão estável específica
RUN git clone -b main https://github.com/EvolutionAPI/evolution-api.git . && \
    git checkout $(git describe --tags `git rev-list --tags --max-count=1`)

# Instalar dependências
RUN npm install --legacy-peer-deps --ignore-scripts

# Copiar variáveis se existirem
RUN cp .env.example .env || true

EXPOSE 8080

# Rodar direto sem build (modo desenvolvimento estável)
CMD ["npm", "run", "start:dev"]
