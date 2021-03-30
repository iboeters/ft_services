usr/bin/mysql_install_db --user=mysql --ldata=/var/lib/mysql

echo "CREATE DATABASE IF NOT EXISTS wordpress;" >> /init.sql
echo "SET PASSWORD FOR 'mysql'@'localhost'=PASSWORD('password');" >> /init.sql
echo "GRANT ALL ON *.* TO 'mysql'@'127.0.0.1' IDENTIFIED BY 'password' WITH GRANT OPTION;" >> /init.sql
echo "GRANT ALL ON *.* TO 'mysql'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;" >> /init.sql
echo "GRANT ALL ON *.* TO 'mysql'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;" >> /init.sql
echo "FLUSH PRIVILEGES;" >> /init.sql

/usr/bin/mysqld --user=mysql --init_file=/init.sql
