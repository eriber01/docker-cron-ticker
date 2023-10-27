FROM node:20.9.0-alpine3.18

# FROM --platform=$BUILDPLATFORM node:20.9.0-alpine3.18

# crea el directorio app
WORKDIR /app

COPY package.json ./

# instala las dependencias
RUN npm install

# copia los archivos
COPY . .

# realiza el test
RUN npm run test

# elimina archivos y dependecias no necesarios es pro
RUN rm -rf tests && rm -rf node_modules

RUN npm install --pro

# corre la imagen
CMD [ "node", "app.js" ]