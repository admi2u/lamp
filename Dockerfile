FROM ubuntu:16.04

RUN apt-get update && apt-get install -y apt-utils vim curl git wget \
    php7.0 \ 
    zip unzip \ 
    apache2=2.4.18-2ubuntu3.5 \ 
    mariadb-server=10.0.34-0ubuntu0.16.04.1 \ 
    mariadb-client=10.0.34-0ubuntu0.16.04.1 \
    libapache2-mod-php7.0 \
    php-mysql php-mbstring php-curl php-gd php-pgsql php-zip && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/bin --filename=composer

EXPOSE 80
EXPOSE 3306

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www/html

ENTRYPOINT ["/entrypoint.sh"]
