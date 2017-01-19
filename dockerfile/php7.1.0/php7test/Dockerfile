FROM php7.1.0
RUN composer global require "squizlabs/php_codesniffer=*" \
    && composer global require phpmd/phpmd \
    && composer global require "sebastian/phpcpd=*" \
    && composer global require phpunit/phpunit \
    && composer global require phploc/phploc \
    && docker-php-ext-install -j$(nproc) tokenizer \
    && pecl install xdebug-2.5.0 \
    && docker-php-ext-enable xdebug