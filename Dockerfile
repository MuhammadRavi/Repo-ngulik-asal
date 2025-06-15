FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
COPY . .

RUN npm install

FROM node:20-alpine AS runtime

WORKDIR /app

COPY --from=builder /app .

CMD ["npm", "start"]