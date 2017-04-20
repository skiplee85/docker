#!/bin/bash

options=""
for((i=2;i<=$#;i++)); do 
    j=${!i}
    options="${options} $j "
done

curl -L http://pecl.php.net/get/$1.tgz > $1.tgz \
    && tar xvf $1.tgz \
    && cd $1 \
    && phpize && ./configure ${options} && make && make install \
    && rm -rf ../*

exit 0
