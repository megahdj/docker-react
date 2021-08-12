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
EXPOSE 80
#dependancies
COPY --from=builder /app/build /usr/share/nginx/html

