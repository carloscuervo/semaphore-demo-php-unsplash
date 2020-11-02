FROM php:7.4-apache

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_ROOT_USER=root

RUN apt-get update && \
    apt-get install  -y nodejs


COPY 000-default.conf /etc/apache2/sites-avaliable/000-default.conf
COPY start-apache /usr/local/bin
RUN a2enmod rewrite

#Copiar aplicación
COPY src /var/www/
RUN chown -R www-data:www-data /var/www

CMD ["start-apache"]
