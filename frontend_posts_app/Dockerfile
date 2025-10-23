FROM node:24-alpine

WORKDIR /app

# 1. Copiar solo package.json primero
COPY package.json package-lock.json* ./

COPY vite.config.ts* ./

# 2. Instalar dependencias
RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]