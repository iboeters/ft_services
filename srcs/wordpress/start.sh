#!/bin/bash
cd /usr/share/webapps/

wp core download
cp /wp-config.php /usr/share/webapps/wordpress
wp core install --title=ft_services --url=192.168.99.221:5050 --admin_user=admin --admin_password=admin --admin_email=iboeters@student.codam.nl --skip-email
wp user create liz lizzy@msn.com –role=editor –first-name=Liz –last-name=Bisschop –user_pass=password
wp user create liza lizzy@msn.com –role=editor –first-name=Liz –last-name=Bisschop –user_pass=password
wp user create lizzy lizzy@msn.com –role=editor –first-name=Liz –last-name=Bisschop –user_pass=password
wp theme install twentytwentyone --activate
wp post create --post_title="POST2" --post_author=liz --post-date=31/03/2021 -post_content="HALLO YOU"

php -S 0.0.0.0:5050 -t /usr/share/webapps/wordpress
# nginx -g "daemon off;"
