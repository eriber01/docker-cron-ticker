FROM node:20.9.0-alpine3.18 as deps
WORKDIR /app
COPY package.json ./
RUN npm install



FROM node:20.9.0-alpine3.18 as builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run test

# Dependencias de Prod
FROM node:20.9.0-alpine3.18 as prod-deps
WORKDIR /app
RUN npm install --prod


FROM node:20.9.0-alpine3.18 as runner


# copia los archivos
COPY . .

# realiza el test
RUN npm run test

# elimina archivos y dependecias no necesarios es pro
RUN rm -rf tests && rm -rf node_modules

RUN npm install --pro

# corre la imagen
CMD [ "node", "app.js" ]