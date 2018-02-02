# Folder permissions:
chmod 777 -R /var/www/html/app/etc /var/www/html/var /var/www/html/pub/media /var/www/html/pub/static
# magento 2.2 specific
chmod 777 -R /var/www/html/generated

# Install:
php bin/magento setup:install \
--base-url="http://localhost/" \
--db-host="db" \
--db-name="main" \
--db-user="main_user" \
--db-password="main_password" \
--admin-firstname="admin" \
--admin-lastname="Doe" \
--admin-email="admin@doe.xyz" \
--admin-user="admin11" \
--admin-password="Testing@123" \
--language="en_US" \
--currency="USD" \
--timezone="America/Chicago" \
--use-rewrites="1" \
--backend-frontname="admin"

chmod 777 -R /var/www/html/app/etc /var/www/html/var /var/www/html/pub/media /var/www/html/pub/static
chmod 777 -R /var/www/html/generated

# Crons:
# * * * * * php ./bin/magento cron:run | grep -v "Ran jobs by schedule" >> /var/www/html/var/log/magento.cron.log
# * * * * * php ./update/cron.php >> /var/www/html/var/log/update.cron.log
# * * * * * php ./bin/magento setup:cron:run >> /var/www/html/var/log/setup.cron.log
