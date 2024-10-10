# Use an official PHP runtime as a parent image
FROM php:8.2 AS php

# Set the working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    git unzip libpq-dev libcurl4-openssl-dev libzip-dev libonig-dev libxml2-dev && \
    docker-php-ext-install pdo pdo_mysql bcmath zip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy Laravel app source code into the container
COPY . .

# Install Laravel dependencies
RUN composer install --no-scripts --no-autoloader && \
    composer dump-autoload --optimize

ENV PORT=8000

ENTRYPOINT [ "docker/entrypoint.sh" ]