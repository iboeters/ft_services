FROM alpine:3.12

# Expose ports
EXPOSE 5000

# Install nginx
RUN apk update
RUN apk upgrade
RUN apk add nginx
RUN apk add openssl
RUN apk add openssh
RUN apk add wget

# Create new user and group 'www' for nginx
RUN adduser -D -g 'www' www

# Create directory for html files
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
# COPY index.html /www

# Copy config files
COPY nginx.conf /etc/nginx
COPY config.inc.php /www

# Create pid location to run nginx, -p can create nested directory
RUN mkdir -p /var/run/nginx

# Install php
RUN apk add --no-cache phpmyadmin php7 php7-fpm php7-mysqli php7-mbstring php7-session php7-json php7-iconv php7-xml
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz
RUN tar -xzf phpMyAdmin-5.1.0-english.tar.gz -C /www/ --strip-components 1

# # Modify configuration file www.conf
# RUN sed -i "s|;listen.owner\s*=\s*nobody|listen.owner = www|g" /etc/php7/php-fpm.d/www.conf;\
#     sed -i "s|;listen.group\s*=\s*nobody|listen.group = www|g" /etc/php7/php-fpm.d/www.conf;\
#     sed -i "s|;listen.mode\s*=\s*0660|listen.mode = 0660|g" /etc/php7/php-fpm.d/www.conf;\
#     sed -i "s|user\s*=\s*nobody|user = www|g" /etc/php7/php-fpm.d/www.conf;\
#     sed -i "s|group\s*=\s*nobody|group = www|g" /etc/php7/php-fpm.d/www.conf;\
#     sed -i "s|;log_level\s*=\s*notice|log_level = notice|g" /etc/php7/php-fpm.d/www.conf;

# # Modify configuration file php.ini
# RUN sed -i "s|display_errors\s*=\s*Off|display_errors = 1|i" /etc/php7/php.ini;\
#     sed -i "s|display_startup_errors\s*=\s*Off|display_startup_errors = 1|i" /etc/php7/php.ini;\
# 	sed -i "s|error_reporting\s*=\s*E_ALL & ~E_DEPRECATED & ~E_STRICT|error_reporting = -1|i" /etc/php7/php.ini;\
# 	sed -i "s|;*memory_limit =.*|memory_limit = ${PHP_MEMORY_LIMIT}|i" /etc/php7/php.ini;\
# 	sed -i "s|;*upload_max_filesize =.*|upload_max_filesize = ${PHP_MAX_UPLOAD}|i" /etc/php7/php.ini;\
# 	sed -i "s|;*max_file_uploads =.*|max_file_uploads = ${PHP_MAX_FILE_UPLOAD}|i" /etc/php7/php.ini;\
# 	sed -i "s|;*post_max_size =.*|post_max_size = ${PHP_MAX_POST}|i" /etc/php7/php.ini;\
# 	sed -i "s|;*cgi.fix_pathinfo=.*|cgi.fix_pathinfo= ${PHP_CGI_FIX_PATHINFO}|i" /etc/php7/php.ini;\
# 	sed -i "s|;*pdo_mysql.default_socket=.*|pdo_mysql.default_socket= /var/lib/mysql/mysql.sock|i" /etc/php7/php.ini;\
# 	sed -i "s|;*mysqli.default_socket=.*|mysqli.default_socket= /var/lib/mysql/mysql.sock|i" /etc/php7/php.ini;

# start nginx and php
COPY start.sh /www/
RUN chmod +x /www/start.sh
CMD ["sh", "/www/start.sh"]
