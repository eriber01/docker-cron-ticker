# dependencias de desarrollo
FROM node:20.9.0-alpine3.18 as deps
WORKDIR /app
COPY package.json ./
RUN npm install

# builder y test
FROM node:20.9.0-alpine3.18 as builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run test

# Dependencias de Prod
FROM node:20.9.0-alpine3.18 as prod-deps
WORKDIR /app
COPY package.json ./
RUN npm install --prod

# corre la imagen
FROM node:20.9.0-alpine3.18 as runner
WORKDIR /app
COPY --from=prod-deps /app/node_modules ./node_modules
COPY app.js ./
COPY tasks/ ./tasks
CMD [ "node", "app.js" ]