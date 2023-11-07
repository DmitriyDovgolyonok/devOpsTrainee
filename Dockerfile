FROM nginx:latest


RUN apt-get update && apt-get install -y openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -newkey rsa:4096 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=US/ST=YourState/L=YourCity/O=YourOrganization/OU=YourUnit/CN=example.com"

COPY index.html /usr/share/nginx/html/
COPY image.png /usr/share/nginx/html/

# Expose HTTP and HTTPS ports
EXPOSE 80
EXPOSE 443

COPY nginx.conf /etc/nginx/conf.d/default.conf

CMD [ "nginx", "-g", "daemon off;" ]