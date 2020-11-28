#!/bin/bash
source .env
docker exec -t $APP_NAME-php-fpm composer install
docker exec -t $APP_NAME-php-fpm php artisan key:generate
docker exec -t $APP_NAME-php-fpm chown -R www-data:www-data storage
docker exec -t $APP_NAME-php-fpm chown -R www-data:www-data bootstrap/cache
docker exec -t $APP_NAME-php-fpm chmod -R 777 storage
docker exec -t $APP_NAME-php-fpm chmod -R 777 bootstrap/cache
docker exec -t $APP_NAME-php-fpm php artisan migrate
docker exec -t $APP_NAME-php-fpm php artisan db:seed