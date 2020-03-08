FROM php:alpine
RUN apk add --no-cache zlib-dev libpng-dev libzip-dev && \
    docker-php-ext-install opcache gd zip && \
    wget https://getgrav.org/download/core/grav-admin/latest && \
    unzip latest && mv grav-admin grav && rm latest

WORKDIR /grav
# ADD user user

EXPOSE 80
CMD php -S 0.0.0.0:80 system/router.php