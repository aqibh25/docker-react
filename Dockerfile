FROM node:16-alpine as builder 
#EVERYthing after this will be known as bbuilder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx 
COPY --from=builder '/app/build' '/usr/share/nginx/html'