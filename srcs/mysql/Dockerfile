FROM alpine:3.12

# Expose ports
EXPOSE 30022

# Install mysql
RUN apk update
RUN apk upgrade
# mysql: to install mariadb, mysql-client: to install commands tools
RUN apk add mysql mysql-client

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
RUN mysqladmin -u root password password
CMD mariadb start

