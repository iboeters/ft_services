FROM alpine:3.12

RUN apk add --no-cache wget php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-phar
RUN apk add nginx
RUN apk add mysql-client

# download wordpress
RUN mkdir -p /www
RUN wget -c https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz -C /www
RUN rm latest.tar.gz

# wp config file to right location
COPY wp-config.php /www
COPY wp-config.php /www/wordpress
COPY wp-config.php .


# ADD USER NGINX
RUN adduser -D -g 'www' www
# RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

COPY nginx.conf /etc/nginx/nginx.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
	chmod +x wp-cli.phar; \
	mv wp-cli.phar /usr/local/bin/wp

# COPY index.html /www
RUN mkdir -p /run/nginx

COPY start.sh .
RUN chmod +x ./start.sh

EXPOSE 5050

CMD ["sh", "./start.sh"]
