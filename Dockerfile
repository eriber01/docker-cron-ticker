FROM node:20.9.0-alpine3.18

# crea el directorio app
WORKDIR /app

# copia los archivos
COPY . .

# instala las dependencias
RUN npm install

# realiza el test
RUN npm run test

# elimina archivos y dependecias no necesarios es pro
RUN rm -rf test && rm -rf node_modules

# corre la imagen
CMD [ "node", "app.js" ]