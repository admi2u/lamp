FROM ubuntu:16.04

RUN apt-get update && apt-get install -y apt-utils vim curl git wget \
    php7.0 \ 
    zip unzip \ 
    apache2=2.4.18-2ubuntu3.5 \ 
    libapache2-mod-php7.0 \
    mysql-server \ 
    mysql-client \
    php-mysql php-mbstring php-curl php-gd php-zip php-dom && \
    ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load
    
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 80
EXPOSE 3306

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

WORKDIR /var/www/html

ENTRYPOINT ["/entrypoint.sh"]
