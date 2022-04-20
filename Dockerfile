# Create a directory on your system to mount the mediawiki volume \
# in this case, we are using a bind mount https://docs.docker.com/storage/bind-mounts/
# This directory is where our data will be saved 
# after creating the directory use this command to run the container with the mounted volume

# docker run -it --name mediawiki -p 80:80 --mount
# type=bind,source=[absolute path to the dir created above],target=/srv/mediawiki [docker-image]

FROM debian:buster

RUN apt-get update \
    && apt-get install -y apache2  \
    && apt-get install -y php \
    && apt-get install -y php-cli php-apcu php-intl php-mbstring php-xml php-mysql mariadb-server php-fileinfo \
    && apt-get install -y php-xml php-json mariadb-client php-curl mariadb-common \
    && apt-get install -y binutils procps coreutils


RUN mkdir -p /srv/mediawiki && ln -s /srv/mediawiki /var/www/html/mw
    
EXPOSE 80

CMD /etc/init.d/apache2 start; bash