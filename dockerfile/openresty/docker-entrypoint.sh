#!/bin/bash
redis-server &
nginx
/usr/bin/memcached -m 64 -p 11211 -u memcache -l 127.0.0.1

exit 0
