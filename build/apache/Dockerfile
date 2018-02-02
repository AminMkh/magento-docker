FROM php:7.1-apache

# echo PHP version :)
RUN php -v & a2query -v

# installing required stuff
RUN apt-get update \
    && apt-get install -y unzip libaio-dev libmcrypt-dev git libzip-dev\
		libmcrypt-dev \
		libpng12-dev \
    && apt-get clean -y

# PHP extensions
RUN \
    docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure mysqli --with-mysqli=mysqlnd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install mcrypt

# PHP composer
RUN curl -sS https://getcomposer.org/installer | php -- --version=$(curl -s https://api.github.com/repos/composer/composer/releases/latest | grep -oP '"tag_name": "\K[^"]+')  --install-dir=/usr/bin --filename=composer

# apache configurations, mod rewrite
RUN a2enmod rewrite
RUN a2enmod ssl

# nodejs latest
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt install -y nodejs

# xdebug, if you want to debug
RUN pecl install xdebug

# zip extension
RUN pecl install xdebug apcu redis zlib zip

# Install SOAP
RUN apt install -y libxml2-dev
RUN docker-php-ext-install soap

# intl
RUN apt install libicu-dev -y
RUN docker-php-ext-configure intl && docker-php-ext-install intl

# xsl
RUN apt update && apt install libxml2 libxml2-dev libxslt-dev -y
RUN docker-php-ext-install xsl

# Install GD
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

# Install Memcached
RUN apt install -y libz-dev libmemcached-dev
RUN pecl install memcached