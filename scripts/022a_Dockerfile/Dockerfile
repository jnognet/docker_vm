# https://docs.docker.com/engine/reference/builder/
# https://docs.docker.com/build/building/multi-stage/

FROM php:7.4.33-apache-bullseye AS main
RUN apt-get update -y && apt install -y libonig-dev libicu-dev zip unzip
RUN docker-php-ext-configure mbstring && docker-php-ext-install mbstring &&  docker-php-ext-enable mbstring
RUN docker-php-ext-configure intl     && docker-php-ext-install intl     &&  docker-php-ext-enable intl

FROM main AS build
COPY --from=composer:2.4.4 /usr/bin/composer /usr/bin/composer
RUN composer --version && php -v && apt-get update -y && apt-get install -y ssh git && ssh -V && git --version
RUN cd / && composer create-project codeigniter4/appstarter app && cd /app && composer update && composer require codeigniter4/translations && composer install 

FROM main
COPY --from=build  /app/ /var/www/html/app/
RUN chown 33.33 -R /var/www/html/app
RUN sed -i 's#DocumentRoot /var/www/html#DocumentRoot /var/www/html/app/public#' /etc/apache2/sites-enabled/000-default.conf
RUN cp /var/www/html/app/env /var/www/html/app/.env
RUN sed -i 's/# CI_ENVIRONMENT = production/CI_ENVIRONMENT = development/' /var/www/html/app/.env
RUN ["/bin/sed", "-i", "s/# app.baseURL = ''/app.baseURL = 'http:\\/\\/localhost:20080'/", "/var/www/html/app/.env"]
