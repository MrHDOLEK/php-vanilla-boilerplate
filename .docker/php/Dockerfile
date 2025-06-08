ARG PHP_VERSION=8.4.3
FROM php:${PHP_VERSION}-fpm-bullseye AS base

ARG COMPOSER_VERSION=2.8.8

RUN apt-get update && apt-get install -y \
     git zip bzip2 libpng-dev libpng-dev libicu-dev \
     vim libjpeg62-turbo-dev libfreetype6-dev libonig-dev \
     libpq-dev libxpm-dev libvpx-dev libbz2-dev zlib1g-dev libzip-dev gnumeric \
    && curl -sS https://getcomposer.org/installer | php -- --version="${COMPOSER_VERSION}" --install-dir=/usr/local/bin --filename=composer \
    && docker-php-ext-install intl bcmath mbstring bz2 gd zip opcache pcntl \
    && docker-php-ext-enable intl pcntl \
    && docker-php-ext-enable intl pcntl \
    && apt-get autoclean \
    && apt-get autoremove

RUN apt-get remove -y git && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

FROM base as prod

ENV COMPOSER_MEMORY_LIMIT=-1

COPY ./.docker/php/php.ini /usr/local/etc/php/conf.d/php.ini
COPY ./.docker/php/php-fpm.conf /etc/php/fpm/php-fpm.conf

WORKDIR /var/www

COPY . /var/www

RUN composer install --optimize-autoloader --prefer-dist --no-dev -o

EXPOSE 9000