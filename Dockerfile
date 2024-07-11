FROM php:8.2.0-apache
RUN apt-get -y update && apt-get -y upgrade

RUN a2enmod rewrite
RUN a2enmod proxy
RUN a2enmod proxy_http

COPY site.prod.conf /etc/apache2/sites-available/
COPY site.prod.conf /etc/apache2/sites-enabled/

#
COPY site.test.conf /etc/apache2/sites-available/
COPY site.test.conf /etc/apache2/sites-enabled/

RUN chgrp -R www-data /var/www
WORKDIR /var/www/html
COPY ../www .