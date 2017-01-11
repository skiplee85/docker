#https://hub.docker.com/_/php/
FROM php:5.6.29-fpm
RUN sed -i 's/http:\/\/deb.debian.org\/debian/http:\/\/mirrors.aliyun.com\/debian/g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
        libmcrypt-dev \
        libcurl3-openssl-dev
RUN docker-php-ext-install -j$(nproc) iconv mcrypt
RUN docker-php-ext-configure --with-openssl=/usr/include/
RUN docker-php-ext-install -j$(nproc) openssl
      # curl gd iconv tidy session pspell soap xml mcrypt openssl
