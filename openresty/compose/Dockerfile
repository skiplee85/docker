FROM openresty/openresty:trusty
# link nginx
RUN ln -s /usr/local/openresty/nginx/sbin/nginx /usr/bin/nginx

RUN apt-get update

# redis
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends redis-server

# php
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends php5-fpm 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends php5-mysqlnd php5-curl php5-redis php5-gd php5-idn php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-memcached php5-ming php5-ps php5-pspell php5-recode php5-sqlite php5-tidy php5-xmlrpc php5-xsl snmp php5-snmp
WORKDIR /etc/php5/fpm/conf.d
RUN ln -s ../../mods-available/mcrypt.ini 20-mcrypt.ini

# memcached
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends memcached

# lib protobuf
COPY protobuf.lua /usr/local/openresty/lualib/
COPY protobuf.so  /usr/local/openresty/lualib/

# lib json_decode
COPY json_decoder.lua /usr/local/openresty/lualib/
COPY libljson.so      /usr/local/openresty/lualib/

# timezone china/shanghai
COPY localtime /etc/localtime

WORKDIR /usr/local/openresty/
COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
