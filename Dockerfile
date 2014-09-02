FROM ubuntu:14.04
MAINTAINER vlada.petrovic+test@gmail.com

RUN apt-get update
RUN apt-get install -y openssh-server apache2 supervisor git php5 curl php5-mysql
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor

ADD supervisor/ /etc/supervisor/conf.d/

# Clone the files into the docker container
RUN git clone https://github.com/VladaTest/PushFaker.git
RUN curl -sS https://getcomposer.org/installer | php
RUN cd PushFaker && /composer.phar install

EXPOSE 22 80
CMD exec supervisord -n
