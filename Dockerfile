FROM php:8.2-apache

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    vim

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer; \
    chmod +x /usr/local/bin/composer

WORKDIR /var/www/html

COPY vhost.conf /etc/apache2/sites-available/000-default.conf
COPY . .

CMD composer install

CMD ["apache2-foreground"]
