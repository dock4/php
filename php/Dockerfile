ARG PHP_VERSION_ARG

FROM php:${PHP_VERSION_ARG}-fpm

# Set Environment Variables
ENV DEBIAN_FRONTEND noninteractive

ARG PHP_VERSION_ARG

RUN set -eux; \
    apt-get update; \
    pecl channel-update pecl.php.net; \
    apt-get install -yqq  --no-install-recommends \
        gnupg curl git \
        ;

RUN set -eux; \
    docker-php-ext-install bcmath; \
    # bz2
    apt-get install -yqq  --no-install-recommends \
        libbz2-dev; \
    docker-php-ext-install bz2; \
    # pdo_dblib
    apt-get install -qq freetds-dev libsybdb5; \
    ln -s /usr/lib/x86_64-linux-gnu/libsybdb.so /usr/lib/; \
    docker-php-ext-install pdo_dblib;

RUN set -eux; \
    # pgsql pdo_pgsql
    apt-get install -yqq  --no-install-recommends \
        libpq-dev \
        ; \
    docker-php-ext-install mysqli; \
    docker-php-ext-install pdo_mysql; \
    docker-php-ext-install pdo_pgsql; \
    docker-php-ext-install pgsql;

RUN set -eux; \
    apt-get install -yqq  --no-install-recommends \
        libfreetype6-dev libjpeg-dev libpng-dev; \
    if [ $(php -r "echo PHP_VERSION_ID - PHP_RELEASE_VERSION;") < "70400" ]; then \
        # PHP 7.4 GD no need config options
        docker-php-ext-configure gd --with-freetype-dir=/usr --with-jpeg-dir=/usr --with-png-dir=/usr; \
    fi; \
    docker-php-ext-install gd; \
    docker-php-ext-install gettext;

RUN set -eux; \
    # gmp
    apt-get install -yqq  --no-install-recommends \
        libgmp-dev; \
    if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
        ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h; \
    fi; \
    docker-php-ext-install \
        gmp \
    ; \
    php -v && php -m;
