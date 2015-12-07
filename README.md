# Docker php-xdebug image

## Base image

* [`php`](https://hub.docker.com/_/php/)

## Supported tags and respective `Dockerfile` links

* [`5.6` (*5.6/Dockerfile*)](https://github.com/MiLk/docker-php-xdebug/blob/master/5.6/Dockerfile)
* [`7.0` (*7.0/Dockerfile*)](https://github.com/MiLk/docker-php-xdebug/blob/master/7.0/Dockerfile)

## How to use this image.

See [the `php` image documentation](https://hub.docker.com/_/php/).

But use `milk/php-xdebug` instead of `php`.

## How to use XDebug

### With apache

It should work out of the box with your IDE.

### In CLI

You must specify the following option:
* `xdebug.remote_autostart`
* `xdebug.remote_host`

For example, you can run:
```
php -d xdebug.remote_autostart=1 -d xdebug.remote_host=192.168.99.1 test.php
```

## Supported Docker versions

This image is officially supported on Docker version 1.8.1.

Support for older versions (down to 1.6) is provided on a best-effort basis.

Please see [the Docker installation documentation](https://docs.docker.com/installation/) for details on how to upgrade your Docker daemon.

