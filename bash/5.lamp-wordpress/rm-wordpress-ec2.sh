#!/bin/bash

# Script để xóa Apache, MySQL, PHP, WordPress, và Certbot

set -e

# 1. Stop Services
echo "Stopping Apache and MySQL services..."
sudo systemctl stop apache2 || true
sudo systemctl stop mysql || true

# 2. Disable Services (Prevent From Starting Automatically)
echo "Disabling Apache and MySQL services..."
sudo systemctl disable apache2 || true
sudo systemctl disable mysql || true

# 3. Remove Apache, MySQL, PHP, and Certbot
echo "Removing Apache, MySQL, PHP, Certbot, and related packages..."
sudo apt-get purge --auto-remove -y apache2 mysql-server mysql-client mysql-common php8.3 libapache2-mod-php8.3 php8.3-mysql php8.3-curl php8.3-xml php8.3-mbstring certbot python3-certbot-apache || true

# 4. Remove Configuration Files
echo "Removing residual configuration files..."
sudo rm -rf /etc/apache2 || true
sudo rm -rf /etc/mysql || true
sudo rm -rf /var/lib/mysql || true
sudo rm -rf /var/log/mysql || true
sudo rm -rf /var/run/mysqld || true
sudo rm -rf /var/www/html || true
sudo rm -rf /etc/letsencrypt || true

# 5. Remove Database and User
echo "Removing MySQL database and user..."
sudo mysql -e "DROP DATABASE wordpress;" || true
sudo mysql -e "DROP USER 'wp_user'@'localhost';" || true

# 6. Remove Virtual Host Configuration
echo "Removing Apache virtual host configuration..."
sudo rm -f /etc/apache2/sites-available/te.nekosama.click.conf || true

# 7. Clean Package Cache
echo "Cleaning package cache..."
sudo apt-get clean || true

# 8. Autoremove Any Unused Packages
echo "Removing unused packages..."
sudo apt-get autoremove --purge -y || true

# 9. Reboot (if necessary)
# echo "Rebooting system..."
# sudo reboot || true

echo "All related packages and configurations have been successfully removed!"
