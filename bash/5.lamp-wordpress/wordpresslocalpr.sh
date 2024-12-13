#!/bin/bash

# Script để cài đặt LAMP stack, WordPress trên Ubuntu local VM với SSL tự ký bằng OpenSSL
set -e

# Thông tin
EMAIL="lelong190110@gmail.com"
DOMAIN="lab.nekosama.click" # Tên miền giả
DB_NAME="wordpress"
DB_USER="wp_user"
DB_PASSWORD="strongpassword"
WP_ADMIN_USER="admin"
WP_ADMIN_PASSWORD="adminpassword"
WP_ADMIN_EMAIL="${EMAIL}"

# Cập nhật hệ thống và cài đặt gói cần thiết
sudo apt update && sudo apt upgrade -y
sudo apt install -y unzip apache2 mysql-server php libapache2-mod-php php-mysql php-curl php-xml php-mbstring libnss3-tools wget openssl

# Khởi tạo thư mục chứa SSL
mkdir -p ~/ssl/${DOMAIN}
cd ~/ssl/${DOMAIN}

# Tạo private key
openssl genpkey -algorithm RSA -out ${DOMAIN}-key.pem

# Tạo CSR
openssl req -new -key ${DOMAIN}-key.pem -out ${DOMAIN}.csr

# Tạo chứng chỉ SSL tự ký
openssl req -x509 -newkey rsa:2048 -keyout ${DOMAIN}-key.pem -out ${DOMAIN}.crt -days 365 -nodes

# Kiểm tra chứng chỉ
openssl x509 -noout -text -in ${DOMAIN}.crt

# Tải và cài đặt WordPress
cd /tmp
wget https://wordpress.org/latest.zip

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

    RewriteEngine on
    RewriteCond %{SERVER_NAME} =${DOMAIN}
    RewriteRule ^ https://%{SERVER_NAME}%{REQUEST_URI} [END,NE,R=permanent]
</VirtualHost>
EOF

# Cấu hình Virtual Host SSL cho Apache
sudo bash -c "cat > /etc/apache2/sites-available/${DOMAIN}-ssl.conf" <<EOF
<VirtualHost *:443>
    ServerAdmin ${EMAIL}
    ServerName ${DOMAIN}
    DocumentRoot /var/www/html/${DOMAIN}

    <Directory /var/www/html/${DOMAIN}>
        AllowOverride All
    </Directory>

    SSLEngine on
    SSLCertificateFile /etc/ssl/certs/${DOMAIN}.crt
    SSLCertificateKeyFile /etc/ssl/private/${DOMAIN}-key.pem

    ErrorLog \${APACHE_LOG_DIR}/${DOMAIN}_ssl_error.log
    CustomLog \${APACHE_LOG_DIR}/${DOMAIN}_ssl_access.log combined
</VirtualHost>
EOF

# Di chuyển chứng chỉ SSL vào thư mục Apache
sudo mv ~/ssl/${DOMAIN}/${DOMAIN}.crt /etc/ssl/certs/
sudo mv ~/ssl/${DOMAIN}/${DOMAIN}-key.pem /etc/ssl/private/

# Kích hoạt Virtual Host và module cần thiết
sudo a2dissite 000-default.conf || true
sudo a2enmod rewrite ssl
sudo a2ensite ${DOMAIN}.conf
sudo a2ensite ${DOMAIN}-ssl.conf
sudo systemctl reload apache2

# Thiết lập MySQL
sudo mysql <<EOF
CREATE DATABASE ${DB_NAME};
CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';
FLUSH PRIVILEGES;
EOF

# Cập nhật file /etc/hosts để ánh xạ domain về localhost
# if ! grep -q "${DOMAIN}" /etc/hosts; then
#     echo "127.0.0.1 ${DOMAIN}" | sudo tee -a /etc/hosts
# fi

# Hoàn tất
sudo systemctl restart apache2

echo "WordPress đã được cài đặt tại http://${DOMAIN} và https://${DOMAIN}"
echo "Đăng nhập trang quản trị WordPress với thông tin sau:"
echo "Username: ${WP_ADMIN_USER}"
echo "Password: ${WP_ADMIN_PASSWORD}"
echo "Email: ${WP_ADMIN_EMAIL}"
