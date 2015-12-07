#!/bin/bash

for version in 5.6 7.0; do
  dockerfile=${version}/Dockerfile
  echo "FROM php:${version}-apache" > ${dockerfile}
  echo >> ${dockerfile}

  hookApcu=$(grep -n "^# install apcu" Dockerfile | cut -d: -f1)
  head -n $((${hookApcu} - 1)) Dockerfile >> ${dockerfile}

  if [ "$version" == "7.0" ]; then
    echo "RUN pecl install apcu-beta" >> ${dockerfile}
  else
    echo "RUN pecl install apcu-stable" >> ${dockerfile}
  fi

  tail -n +$((${hookApcu}+ 1)) Dockerfile >> ${dockerfile}

  docker build -t milk/php-xdebug:${version} ${version}
done
