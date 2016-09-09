FROM openresty/openresty:trusty
# redis
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends redis-server

# lib protobuf
COPY protobuf.lua /usr/local/openresty/lualib/
COPY protobuf.so  /usr/local/openresty/lualib/

COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
RUN chmod 755 /bin/docker-entrypoint.sh

ENTRYPOINT ["/bin/docker-entrypoint.sh"]
