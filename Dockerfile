FROM node:alpine as react-app-builder
WORKDIR '/app'
COPY package.json .	
RUN npm install
COPY . .
RUN npm run build #build project will be in /app/builder/


FROM nginx
EXPOSE 80
#Expose is for deployment env - AWS Beanstalk to map the port 
COPY --from=react-app-builder /app/build /usr/share/nginx/html/