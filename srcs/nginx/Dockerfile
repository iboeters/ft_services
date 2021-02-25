# Install Nginx
FROM alpine:3.12

EXPOSE 80 443 22

RUN apk update
RUN apk upgrade
RUN apk add nginx
RUN apk add openssl
RUN apk add openssh
COPY nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /var/run/nginx

RUN mkdir /root/mkcert/
COPY localhost.cert /root/mkcert/
COPY localhost.key /root/mkcert/

RUN adduser -D -g 'www' www
RUN chown www-data:www-data /usr/share/nginx/html/ -R

# COPY nginx.conf /etc/nginx/sites-available/
# RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/
# RUN chown www-data:www-data /usr/share/nginx/html/ -R

CMD run nginx -g "daemon off;"