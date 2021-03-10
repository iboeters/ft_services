FROM alpine:3.12

# Expose ports
EXPOSE 30022

# Install mysql
RUN apk update
RUN apk upgrade
RUN apk add mysql mysql-client

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
RUN mysqladmin -u root password toor
CMD mariadb start

