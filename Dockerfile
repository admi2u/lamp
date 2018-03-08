FROM ubuntu:16.04

RUN apt-get update && apt-get install -y vim curl git wget \
    php7.0 apache2=2.4.18 mariadb-server=10.0.34 mariadb-client \
    php-mysql php-mbstring php-curl php-gd php-pgsql && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin --filename=composer

EXPOSE 80
EXPOSE 3306

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www/html

ENTRYPOINT ["/entrypoint.sh"]
