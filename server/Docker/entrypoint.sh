#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Check if Composer dependencies are installed
if [ ! -f "vendor/autoload.php" ]; then
    echo "Installing Composer dependencies..."
    composer install --no-progress --no-interaction --optimize-autoloader
fi

# Check if .env file exists, and create it from .env.example if not
if [ ! -f ".env" ]; then
    echo "Creating .env file for environment: $APP_ENV"
    cp .env.example .env
    php artisan key:generate --no-interaction --force
else
    echo ".env file exists."
fi

# Run migrations
echo "Running database migrations..."
php artisan migrate --force

# Clear and optimize caches
echo "Clearing and optimizing cache..."
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear

# Start Laravel development server
echo "Starting Laravel server on port $PORT..."
php artisan serve --port=$PORT --host=0.0.0.0 --env=.env

# Execute the main Docker entrypoint
exec docker-php-entrypoint "$@"