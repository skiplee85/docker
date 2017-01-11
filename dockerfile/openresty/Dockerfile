FROM openresty/openresty:trusty
# link nginx
RUN ln -s /usr/local/openresty/nginx/sbin/nginx /usr/bin/nginx

# lib protobuf
COPY protobuf.lua /usr/local/openresty/lualib/
COPY protobuf.so  /usr/local/openresty/lualib/

# lib json_decode
COPY json_decoder.lua /usr/local/openresty/lualib/
COPY libljson.so      /usr/local/openresty/lualib/

# timezone china/shanghai
COPY localtime /etc/localtime

RUN sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu\//http:\/\/mirrors.aliyun.com\/ubuntu\//g' /etc/apt/sources.list
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
redis-server \
libmagickwand-dev \
memcached

WORKDIR /usr/local/openresty/
COPY docker-entrypoint.sh /
RUN chmod 755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
