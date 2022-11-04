# https://docs.docker.com/engine/reference/builder/
# https://docs.docker.com/build/building/multi-stage/

FROM php:7.4.33-apache-bullseye AS build
COPY --from=composer:2.4.4 /usr/bin/composer /usr/bin/composer
RUN composer --version && php -v
RUN apt-get update -y && apt-get install -y ssh git
RUN ssh -V && git --version
RUN apt install -y libonig-dev libicu-dev zip unzip
RUN docker-php-ext-configure mbstring && docker-php-ext-install mbstring
RUN docker-php-ext-configure intl && docker-php-ext-install intl
RUN cd / && composer create-project codeigniter4/appstarter app && cd /app && composer update && composer install 

FROM php:7.4.33-apache-bullseye
COPY --from=build  /app/ /var/www/html/app/
RUN sed -i 's#DocumentRoot /var/www/html#DocumentRoot /var/www/html/app/public#' /etc/apache2/sites-enabled/000-default.conf 
