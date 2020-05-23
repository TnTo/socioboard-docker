FROM php:apache
WORKDIR /var/www/html
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
COPY Socioboard-4.0/socioboard-web-php/ /var/www/html/
RUN apt-get update; apt-get install -y libzip-dev git; apt-get clean; \
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
