FROM alpine:3.12

RUN apk add --no-cache wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk add nginx

# download wordpress
RUN mkdir -p /usr/share/webapps/
RUN wget -c https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz --strip-components=1 -C /usr/share/webapps/
RUN rm latest.tar.gz

# #ADD USER NGINX
RUN adduser -D -g 'www' www
RUN mkdir /www 
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
# RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY nginx.conf /etc/nginx/nginx.conf
# COPY index.html /www
RUN mkdir -p /run/nginx

# copy relevant file
COPY wp-config.php /usr/share/webapps/wp-config.php
# COPY /usr/share/webapps/index.php /usr/share/webapps/wordpress
COPY start.sh .
RUN chmod +x ./start.sh

EXPOSE 5050

CMD sh ./start.sh