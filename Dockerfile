#Base image 
FROM node:alpine as builder 

#dependancies
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
#run command
RUN npm run build

#second phase

#base image
FROM nginx

#dependancies
COPY --from=builder /app/build /usr/share/nginx/html

