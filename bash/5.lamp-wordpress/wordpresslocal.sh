#!/bin/bash
# lỗi tùm lum do chắc cũ r nên dùng file chạy ec2 hoặc cái file localpr
echo 'Please enter your domain of preference without www:'
read DOMAIN
echo "Please enter your Database username:"
read DBUSERNAME
echo "Please enter your Database password:"
read DBPASSWORD
echo "Please enter your Database name:"
read DBNAME
ip=`hostname -I | cut -f1 -d' '`
# tải công cụ cần 
lamp_install () {
 apt update -y
 apt install ufw
 ufw enable
 ufw allow OpenSSH
 ufw allow in "WWW Full"
 apt install apache2 -y
 apt install mariadb-server
 mysql_secure_installation -y
 apt install php libapache2-mod-php php-mysql -y
 sed -i "2d" /etc/apache2/mods-enabled/dir.conf
 sed -i "2i\\\tDirectoryIndex index.php index.html
index.cgi index.pl index.xhtml index.htm" /etc/apache2/modsenabled/dir.conf
 systemctl reload apache2
}
# setup file 
# Tạo thư mục chứa website và thay đổi quyền sở hữu.
# Tạo một virtual host mới cho Apache với cấu hình như ServerName, ServerAlias, và DocumentRoot.
# Kích hoạt virtual host mới và vô hiệu hóa site mặc định.
# Tải lại Apache để cấu hình có hiệu lực.
apache_virtual_host_setup () {
    mkdir /var/www/$DOMAIN
    chown -R $USER:$USER /var/www/$DOMAIN

    echo "<VirtualHost *:80>" >> /etc/apache2/sites-available/$DOMAIN.conf
    echo -e "\tServerName $DOMAIN" >> /etc/apache2/sites-available/$DOMAIN.conf
    echo -e "\tServerAlias www.$DOMAIN" >> /etc/apache2/sites-available/$DOMAIN.conf
    echo -e "\tServerAdmin webmaster@localhost" >> /etc/apache2/sites-available/$DOMAIN.conf
    echo -e "\tDocumentRoot /var/www/$DOMAIN" >> /etc/apache2/sites-available/$DOMAIN.conf
    echo -e '\tErrorLog ${APACHE_LOG_DIR}/error.log' >> /etc/apache2/sites-available/$DOMAIN.conf
    echo -e '\tCustomLog ${APACHE_LOG_DIR}/access.log combined' >> /etc/apache2/sites-available/$DOMAIN.conf
    echo "</VirtualHost>" >> /etc/apache2/sites-available/$DOMAIN.conf
    a2ensite $DOMAIN
    a2dissite 000-default
    systemctl reload apache2

}


        # Hàm ssl_config() thực hiện:

        # Tạo chứng chỉ tự ký và khóa riêng.
        # Cấu hình file SSL để sử dụng chứng chỉ mới.
        # Kích hoạt chuyển hướng HTTP → HTTPS.
        # Kích hoạt các module và cấu hình liên quan đến SSL.
        # Tải lại Apache để áp dụng thay đổi.


ssl_config () {
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt
    
    echo "SSLCipherSuite EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH" >> /etc/apache2/conf-available/ssl-params.conf
    echo "SSLProtocol All -SSLv2 -SSLv3 -TLSv1 -TLSv1.1" >> /etc/apache2/conf-available/ssl-params.conf
    echo "SSLHonorCipherOrder On" >> /etc/apache2/conf-available/ssl-params.conf
    echo "Header always set X-Frame-Options DENY" >> /etc/apache2/conf-available/ssl-params.conf
    echo "Header always set X-Content-Type-Options nosniff" >> /etc/apache2/conf-available/ssl-params.conf
    echo "SSLCompression off" >> /etc/apache2/conf-available/ssl-params.conf
    echo "SSLUseStapling on" >> /etc/apache2/conf-available/ssl-params.conf
    echo "SSLStaplingCache \"shmcb:logs/stapling-cache(150000)\"" >> /etc/apache2/conf-available/ssl-params.conf
    echo "SSLSessionTickets Off" >> /etc/apache2/conf-available/ssl-params.conf
    
    cp /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-available/default-ssl.conf.bak
    sed -i "s/var\/www\/html/var\/www\/$DOMAIN/1" /etc/apache2/sites-available/default-ssl.conf
    sed -i "s/etc\/ssl\/certs\/ssl-cert-snakeoil.pem/etc\/ssl\/certs\/apache-selfsigned.crt/1" /etc/apache2/sites-available/default-ssl.conf
    sed -i "s/etc\/ssl\/private\/ssl-cert-snakeoil.key/etc\/ssl\/private\/apache-selfsigned.key/1" /etc/apache2/sites-available/default-ssl.conf
    sed -i "4i\\\t\tServerName $ip" /etc/apache2/sites-available/default-ssl.conf
    sed -i "22i\\\tRedirect permanent \"/\" \"https://$ip/\"" /etc/apache2/sites-available/000-default.conf
    a2enmod ssl
    a2enmod headers
    a2ensite default-ssl
    a2enconf ssl-params
    systemctl reload apache2
}
# tạo db 
db_config () {
    mysql -e "CREATE DATABASE $DBNAME;"
    mysql -e "GRANT ALL ON $DBNAME.* TO '$DBUSERNAME'@'localhost' IDENTIFIED BY '$DBPASSWORD' WITH GRANT OPTION;"
    mysql -e "FLUSH PRIVILEGES;"
}

        # Cài đặt các gói PHP và Apache để hỗ trợ WordPress.
        # Cấu hình Apache để sử dụng .htaccess và cho phép rewrite URL.
        # Tải, giải nén và cấu hình WordPress.
        # Thiết lập quyền truy cập cho các thư mục và tệp trong thư mục WordPress.
        # Cấu hình tệp wp-config.php với các thông tin cơ sở dữ liệu và bảo mật.
wordpress_config () {
    db_config

    
    apt install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
    systemctl restart apache2
    sed -i "8i\\\t<Directory /var/www/$DOMAIN/>" /etc/apache2/sites-available/$DOMAIN.conf
    sed -i "9i\\\t\tAllowOverride All" /etc/apache2/sites-available/$DOMAIN.conf
    sed -i "10i\\\t</Directory>" /etc/apache2/sites-available/$DOMAIN.conf

    a2enmod rewrite
    systemctl restart apache2

    apt install curl
    cd /tmp
    curl -O https://wordpress.org/latest.tar.gz
    tar xzvf latest.tar.gz
    touch /tmp/wordpress/.htaccess
    cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
    mkdir /tmp/wordpress/wp-content/upgrade
    cp -a /tmp/wordpress/. /var/www/$DOMAIN
    chown -R www-data:www-data /var/www/$DOMAIN
    find /var/www/$DOMAIN/ -type d -exec chmod 750 {} \;
    find /var/www/$DOMAIN/ -type f -exec chmod 640 {} \;
    curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> /var/www/$DOMAIN/wp-config.php
    echo "define('FS_METHOD', 'direct');" >> /var/www/$DOMAIN/wp-config.php
    sed -i "51,58d" /var/www/$DOMAIN/wp-config.php
    sed -i "s/database_name_here/$DBNAME/1" /var/www/$DOMAIN/wp-config.php
    sed -i "s/username_here/$DBUSERNAME/1" /var/www/$DOMAIN/wp-config.php
    sed -i "s/password_here/$DBPASSWORD/1" /var/www/$DOMAIN/wp-config.php
}
# chạy mấy hàm trên 
execute () {
    lamp_install
    apache_virtual_host_setup
    ssl_config
    wordpress_config
}

execute


# Install LAMP
# Create a virtual host
# Configure SSL
# Install WordPress
# Configure WordPress