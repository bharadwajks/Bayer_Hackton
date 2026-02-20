FROM node:18-alpine

WORKDIR /app

COPY package.json package-lock.json* ./
RUN npm install --omit=dev

COPY patient-service.js .

EXPOSE 3000

CMD ["node", "patient-service.js"]