# Stage 1: Build the application
FROM node:14 AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Stage 2: Create the final image
FROM node:14
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY package*.json ./
RUN npm install --only=production
EXPOSE 5000
CMD [ "npm", "start" ]
