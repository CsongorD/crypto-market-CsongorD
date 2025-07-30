#!/bin/bash

set -e

echo "Waiting for MySQL to be ready..."
until mysql -h"$DB_HOST" -u"$DB_USERNAME" -p"$DB_PASSWORD" -e 'SELECT 1'; do
    echo "MySQL is unavailable - sleeping"
    sleep 3
done

# Install dependencies if not present
if [ ! -f "vendor/autoload.php" ]; then
    echo "Installing Composer dependencies..."
    composer install --no-progress --no-interaction --optimize-autoloader
fi

# Setup .env
if [ ! -f ".env" ]; then
    echo "Creating .env file..."
    cp .env.example .env
    php artisan key:generate
fi

echo "Running migrations..."
php artisan migrate --force

echo "Optimizing Laravel..."
php artisan optimize:clear

echo "Starting Laravel on port $PORT..."
php artisan serve --host=0.0.0.0 --port=$PORT
