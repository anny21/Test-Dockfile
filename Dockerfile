FROM debian:buster

RUN apt-get update \
   && apt-get install -y apache2  \
    && apt-get install -y php \
    && apt-get install -y php-cli php-apcu php-intl php-mbstring php-xml php-mysql mariadb-server php-fileinfo \
    && apt-get install -y php-xml php-json mariadb-client php-curl mariadb-common \
    && apt-get install -y binutils procps coreutils
    
EXPOSE 80

CMD /etc/init.d/apache2 start; bash