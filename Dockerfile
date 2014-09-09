FROM ubuntu:14.04
MAINTAINER vlada.petrovic+test@gmail.com

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y collectd supervisor git php5 curl php5-mysql
RUN mkdir -p /var/log/supervisor

ADD supervisor/ /etc/supervisor/conf.d/
ADD assets/ /
ADD collectd/collectd.conf /etc/collectd/

# Clone the files into the docker container
RUN git clone https://github.com/VladaTest/PushFaker.git
RUN curl -sS https://getcomposer.org/installer | php
RUN cd PushFaker && /composer.phar install

# Start
RUN chmod +x /faker-start
