#https://hub.docker.com/_/php/
FROM php:7.1.0-fpm
RUN sed -i 's/http:\/\/deb.debian.org\/debian/http:\/\/mirrors.aliyun.com\/debian/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libxml2-dev \
        libtidy-dev \
        ssh \
        zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) iconv mcrypt gd iconv tidy soap pdo_mysql 
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
# install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN echo 'PATH=$PATH:/root/.composer/vendor/bin' >> /root/.bashrc
RUN mv composer.phar /usr/bin/composer
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com

# add ZipArchive
RUN pecl install zip && docker-php-ext-enable zip

ENTRYPOINT ["/entrypoint.sh"]
