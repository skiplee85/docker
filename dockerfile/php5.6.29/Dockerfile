#https://hub.docker.com/_/php/
FROM php:5.6.29-fpm
ENV PATH $PATH:/root/.composer/vendor/bin
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
COPY composer.phar /usr/bin/composer
RUN chmod +x /entrypoint.sh
RUN chmod +x /usr/bin/composer
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com

ENTRYPOINT ["/entrypoint.sh"]
