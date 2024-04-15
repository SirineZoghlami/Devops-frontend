FROM nginx:latest

RUN rm -rf /usr/share/nginx/html/*

COPY dist/summer-workshop-angular /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
