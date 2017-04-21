# https://hub.docker.com/r/openresty/openresty/
FROM openresty/openresty:trusty
# link nginx
RUN ln -s /usr/local/openresty/nginx/sbin/nginx /usr/bin/nginx
# lib protobuf
COPY protobuf.lua protobuf.so /usr/local/openresty/lualib/
# timezone Asia/Shanghai
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# ssh
RUN sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu\//http:\/\/mirrors.aliyun.com\/ubuntu\//g' /etc/apt/sources.list \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ssh

# entrypoint
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
WORKDIR /usr/local/openresty
CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"];