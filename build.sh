#!/usr/bin/env bash

for version in 5.6 7.0 7.1; do
    docker build -t milk/php-xdebug:${version} ${version}
done
