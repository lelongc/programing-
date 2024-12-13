#!/bin/bash

# Script để cài đặt LAMP stack, WordPress và cấu hình SSL trên EC2 (Ubuntu 24.04)
set -e


            # read -p "Nhập email của bạn: " EMAIL
            # read -p "Nhập domain của bạn: " DOMAIN
            # read -p "Nhập tên cơ sở dữ liệu MySQL: " DB_NAME
            # read -p "Nhập tên người dùng MySQL: " DB_USER
            # read -sp "Nhập mật khẩu cơ sở dữ liệu MySQL: " DB_PASSWORD
            # echo
            # read -p "Nhập tên người dùng WordPress quản trị: " WP_ADMIN_USER
            # read -sp "Nhập mật khẩu người dùng WordPress quản trị: " WP_ADMIN_PASSWORD
            # echo
            # read -p "Nhập email người dùng WordPress quản trị: " WP_ADMIN_EMAIL
# Thông tin
EMAIL="lelong190110@gmail.com"
DOMAIN="te.nekosama.click"
DB_NAME="wordpress"
DB_USER="wp_user"
DB_PASSWORD="strongpassword"
WP_ADMIN_USER="admin"
WP_ADMIN_PASSWORD="adminpassword"
WP_ADMIN_EMAIL="${EMAIL}"

# Cập nhật hệ thống và cài đặt gói
sudo apt update && sudo apt upgrade -y

# Cài đặt Apache, MySQL, PHP
sudo apt install -y unzip apache2 mysql-server php8.3 libapache2-mod-php8.3 php8.3-mysql php8.3-curl php8.3-xml php8.3-mbstring
sudo a2dismod mpm_event
########################### khúc trên fix mãi do mấy cái php nó lằng nhằng mấy cái extension có khi sẽ lỗi ae tự mò chatgpt , mò tắt mãi thì ra do xung đột gì đó a2dismod mpm_event


# Tải và cài đặt WordPress
cd /tmp
curl -O https://wordpress.org/latest.zip
unzip -o latest.zip
sudo mv wordpress /var/www/html/${DOMAIN}

# Cấu hình quyền
sudo chown -R www-data:www-data /var/www/html/${DOMAIN}
sudo chmod -R 755 /var/www/html/${DOMAIN}

# Tạo file wp-config.php
sudo cp /var/www/html/${DOMAIN}/wp-config-sample.php /var/www/html/${DOMAIN}/wp-config.php
sudo sed -i "s/database_name_here/${DB_NAME}/" /var/www/html/${DOMAIN}/wp-config.php
sudo sed -i "s/username_here/${DB_USER}/" /var/www/html/${DOMAIN}/wp-config.php
sudo sed -i "s/password_here/${DB_PASSWORD}/" /var/www/html/${DOMAIN}/wp-config.php

# Cấu hình Virtual Host cho Apache
sudo bash -c "cat > /etc/apache2/sites-available/${DOMAIN}.conf" <<EOF
<VirtualHost *:80>
    ServerAdmin ${EMAIL}
    ServerName ${DOMAIN}
    DocumentRoot /var/www/html/${DOMAIN}

    <Directory /var/www/html/${DOMAIN}>
        AllowOverride All
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/${DOMAIN}_error.log
    CustomLog \${APACHE_LOG_DIR}/${DOMAIN}_access.log combined

    # Redirect HTTP to HTTPS
    RewriteEngine on
    RewriteCond %{SERVER_NAME} =${DOMAIN}
    RewriteRule ^ https://%{SERVER_NAME}%{REQUEST_URI} [END,NE,R=permanent]
</VirtualHost>
EOF

sudo a2dissite 000-default.conf || true
# Kích hoạt mod_rewrite và Virtual Host
sudo a2enmod rewrite
sudo a2ensite ${DOMAIN}.conf
sudo systemctl reload apache2


# Thiết lập MySQL
sudo mysql <<EOF
CREATE DATABASE ${DB_NAME};
CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';
FLUSH PRIVILEGES;
EOF

# Cài đặt SSL với Let's Encrypt
sudo apt install -y certbot python3-certbot-apache
sudo certbot --apache --non-interactive --agree-tos --email ${EMAIL} -d ${DOMAIN}

# Hoàn tất
sudo systemctl restart apache2

echo "WordPress đã được cài đặt tại http://${DOMAIN} (hoặc https://${DOMAIN})"
echo "Đăng nhập trang quản trị WordPress với thông tin sau:"
echo "Username: ${WP_ADMIN_USER}"
echo "Password: ${WP_ADMIN_PASSWORD}"
echo "Email: ${WP_ADMIN_EMAIL}"
