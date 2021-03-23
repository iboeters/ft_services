usr/bin/mysql_install_db --user=$MYSQL_USER --ldata=/var/lib/mysql

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;" >> /init.sql
echo "SET PASSWORD FOR '$MYSQL_USER'@'localhost'=PASSWORD('${MYSQL_USER_PASSWORD}');" >> /init.sql
echo "GRANT ALL ON *.* TO '$MYSQL_USER'@'127.0.0.1' IDENTIFIED BY '$MYSQL_USER_PASSWORD' WITH GRANT OPTION;" >> /init.sql
echo "GRANT ALL ON *.* TO '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_USER_PASSWORD' WITH GRANT OPTION;" >> /init.sql
echo "GRANT ALL ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD' WITH GRANT OPTION;" >> /init.sql
echo "FLUSH PRIVILEGES;" >> /init.sql

/usr/bin/mysqld --console --init_file=/init.sql