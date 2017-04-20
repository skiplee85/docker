#https://hub.docker.com/_/php/
FROM php:7.0-fpm
# change sources
RUN sed -i 's/http:\/\/deb.debian.org\/debian/http:\/\/mirrors.aliyun.com\/debian/g' /etc/apt/sources.list
# common ext
RUN apt-get update && apt-get install -y \
        libssl-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libxml2-dev \
        libtidy-dev \
        zlib1g-dev \
        ssh \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) iconv mcrypt gd iconv tidy soap pdo_mysql mysqli
# pecl install shell
COPY pecl-package-manual-install.sh /
RUN chmod +x /pecl-package-manual-install.sh
# update pecl
RUN pecl channel-update pecl.php.net
# memcached
RUN apt-get install -y libmemcached-dev && pecl install memcached-3.0.3 && docker-php-ext-enable memcached
# zip
RUN apt-get install -y zip && pecl install zip-1.13.5 && docker-php-ext-enable zip
# redis
RUN pecl install redis-3.1.1 && docker-php-ext-enable redis
# mongodb
RUN /pecl-package-manual-install.sh mongodb-1.2.8 && docker-php-ext-enable mongodb
# rabbitmq
RUN apt-get install -y librabbitmq-dev && pecl install amqp-1.9.0 && docker-php-ext-enable amqp
# yaf 
RUN pecl install yaf-3.0.4 && docker-php-ext-enable yaf
# swoole
RUN pecl install swoole-2.0.7 && docker-php-ext-enable swoole

# install composer
COPY composer /usr/bin/
RUN chmod +x /usr/bin/composer
RUN echo 'PATH=$PATH:/root/.composer/vendor/bin' >> /root/.bashrc
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com
# entrypoint
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
