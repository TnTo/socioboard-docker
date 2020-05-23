FROM php:fpm-alpine
WORKDIR /var/www/html
COPY Socioboard-4.0/socioboard-web-php/ /var/www/html/
RUN apk update; apk --no-cache upgrade; \
    apk add --no-cache libzip-dev git; \
    docker-php-ext-install bcmath pdo_mysql zip; \
    docker-php-ext-enable opcache
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN composer global require laravel/installer
RUN composer update
COPY php/php.ini $PHP_INI_DIR/php.ini
COPY php/.env /var/www/html/.env
RUN php artisan key:generate
RUN chown -R www-data:www-data /var/www/html; \
    chmod -R 755 /var/www/html
