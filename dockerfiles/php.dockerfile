FROM php:8.2.4-fpm-alpine
 
WORKDIR /var/www/html
 
COPY ./src /var/www/html
 
RUN docker-php-ext-install pdo pdo_mysql
 
RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

# Set proper permissions for storage and bootstrap/cache directories
RUN chown -R laravel:laravel /var/www/html/storage /var/www/html/bootstrap/cache
RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Change ownership of all files to laravel
RUN chown -R laravel:laravel /var/www/html
 
USER laravel