FROM alpine:3.12

# Expose ports
EXPOSE 80 443 22

# Install nginx
RUN apk update
RUN apk upgrade
RUN apk add nginx
RUN apk add openssl

# Replace default config file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy ssl certificates
COPY localhost.cert /etc/nginx/
COPY localhost.key /etc/nginx/

# Create new user and group 'www' for nginx
RUN adduser -D -g 'www' www

# Create directory for html files
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

# Create pid location to run nginx
RUN mkdir -p /var/run/nginx

CMD ["nginx", "-g", "daemon off;"]