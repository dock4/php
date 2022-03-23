ARG PHP_VERSION_ARG

FROM php:${PHP_VERSION_ARG}-fpm

# Set Environment Variables
ENV DEBIAN_FRONTEND noninteractive

ARG PHP_VERSION_ARG

RUN set -eux; \
    apt-get update; \
    pecl channel-update pecl.php.net; \
    apt-get install -yqq  --no-install-recommends gnupg curl \
        git \
    ;
