#!/usr/bin/env bash

declare -A apcu_version
apcu_version=(
	[5.6]='apcu-4.0.10'
	[7.0]='apcu-stable'
)

declare -A xdebug_version
xdebug_version=(
	[5.6]='xdebug-stable'
	[7.0]='xdebug-beta'
)

declare -A extensions_dir
extensions_dir=(
	[5.6]='no-debug-non-zts-20131226'
	[7.0]='no-debug-non-zts-20151012'
)

for version in 5.6 7.0; do
  dockerfile=${version}/Dockerfile
  echo "FROM php:${version}-apache" > ${dockerfile}
  echo >> ${dockerfile}

  cat Dockerfile \
    | sed "s/#APCU_VERSION#/${apcu_version[${version}]}/g" \
    | sed "s/#XDEBUG_VERSION#/${xdebug_version[${version}]}/g" \
    | sed "s/#EXTENSION_DIR#/${extensions_dir[${version}]}/g" \
    >> ${dockerfile}
done
