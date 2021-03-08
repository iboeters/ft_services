FROM alpine:3.12

# Expose ports
EXPOSE 80 443 22

# Install nginx
RUN apk update
RUN apk upgrade
RUN apk add nginx
RUN apk add openssl
RUN apk add openssh

# Create new user and group 'www' for nginx
RUN adduser -D -g 'www' www

# Create directory for html files
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY index.html /www

# Replace default config file
COPY nginx.conf /etc/nginx/

# Create ssl certificates
RUN ssh-keygen -A
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.cert

# Create pid location to run nginx, -p to create nested directory
RUN mkdir -p /var/run/nginx

CMD ["nginx", "-g", "daemon off;"]
