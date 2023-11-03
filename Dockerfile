FROM nginx:latest

RUN apt-get update && apt-get install -y certbot python3-certbot-nginx

COPY index.html /usr/share/nginx/html/
COPY image.png /usr/share/nginx/html/

EXPOSE 80
EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]