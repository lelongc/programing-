#!/bin/bash

# Script để xóa toàn bộ cấu hình và dữ liệu đã tải về và cài đặt
set -e

# Thông tin
DOMAIN="lab.nekosama.click" # Tên miền giả
DB_NAME="wordpress"
DB_USER="wp_user"
DB_PASSWORD="strongpassword"

# Xóa thư mục WordPress và các file liên quan
echo "Xóa thư mục WordPress..."
sudo rm -rf /var/www/html/${DOMAIN}

# Xóa chứng chỉ SSL và các file liên quan
echo "Xóa chứng chỉ SSL..."
sudo rm -f /etc/ssl/certs/${DOMAIN}.crt
sudo rm -f /etc/ssl/private/${DOMAIN}-key.pem

# Xóa Virtual Host và cấu hình Apache
echo "Xóa cấu hình Virtual Host Apache..."
sudo rm -f /etc/apache2/sites-available/${DOMAIN}.conf
sudo rm -f /etc/apache2/sites-available/${DOMAIN}-ssl.conf

# Vô hiệu hóa Virtual Hosts
echo "Vô hiệu hóa các Virtual Host Apache..."
sudo a2dissite ${DOMAIN}.conf || true
sudo a2dissite ${DOMAIN}-ssl.conf || true

# Xóa MySQL database và người dùng
echo "Xóa database và người dùng MySQL..."
sudo mysql -e "DROP DATABASE ${DB_NAME};"
sudo mysql -e "DROP USER '${DB_USER}'@'localhost';"

# Xóa các gói đã cài đặt
echo "Xóa các gói đã cài đặt..."
sudo apt-get purge -y apache2 mysql-server php libapache2-mod-php php-mysql php-curl php-xml php-mbstring libnss3-tools wget openssl

# Xóa các file không cần thiết
echo "Xóa các file tạm..."
sudo rm -rf /tmp/latest.zip

# 7. Clean Package Cache
echo "Cleaning package cache..."
sudo apt-get clean || true

# 8. Autoremove Any Unused Packages
echo "Removing unused packages..."
sudo apt-get autoremove --purge -y || true
# Hoàn tất
echo "Cài đặt đã bị xóa hoàn toàn."
