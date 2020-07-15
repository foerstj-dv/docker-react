FROM node:alpine as bob
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=bob /app/build /usr/share/nginx/html
