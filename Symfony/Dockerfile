FROM php:8.2-apache

WORKDIR /app/src

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY ./SymfonyTest .
COPY entrypoint.sh /entrypoint.sh


RUN docker-php-ext-install pdo_mysql
RUN composer install --no-scripts
RUN sed -i 's|/var/www/html|/app/src/public|g' /etc/apache2/sites-available/000-default.conf && a2enmod rewrite
RUN sed -i 's|/var/www/html|/app/src/public|g' /etc/apache2/apache2.conf
RUN echo '<Directory /app/src/public>\n\tAllowOverride All\n\tRequire all granted\n</Directory>' >> /etc/apache2/sites-available/000-default.conf
RUN chown -R www-data:www-data /app/src
RUN chmod +x /entrypoint.sh
EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]