FROM node:20-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]
RUN ls /app

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html