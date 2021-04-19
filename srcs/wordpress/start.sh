#!/bin/bash
php-fpm7
cd /www/

while :
do
    mysqladmin -h mysql ping
    if [ $? == 0 ]
    then
        break
    fi
    sleep 10
done

wp core download
cp ./wp-config.php /www/wordpress
wp core install --title=ft_services --url=192.168.99.221:5050 --admin_user=admin --admin_password=admin --admin_email=iboeters@student.codam.nl --skip-email
wp user create liz lizzy@msn.com –role=editor –first-name=Liz –last-name=Bisschop –user_pass=password
wp user create liza lizzy@msn.com –role=editor –first-name=Liz –last-name=Bisschop –user_pass=password
wp user create lizzy lizzy@msn.com –role=editor –first-name=Liz –last-name=Bisschop –user_pass=password
wp theme install twentytwentyone --activate
wp post create --post_title="POST2" --post_author=liz --post-date=31/03/2021 -post_content="HALLO YOU"

nginx
# php -S 0.0.0.0:5050 -t /www
# nginx -g "daemon off;"
