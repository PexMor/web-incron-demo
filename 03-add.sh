#!/bin/bash

apt-get install -y \
    libapache2-mod-php \
    php-pear php-tcpdf php-gd php-curl \
    squid3 iputils-ping net-tools \
    php-cli dnsmasq-base yafc tcpdump \
    telnet telnet-ssl tshark sudo \
    dnsutils openssh-client nmap \
    links tftp \
    redis-tools redis-server \
    beanstalkd python-beanstalkc \
    mosquitto mosquitto-clients \
    incron \
    openssl less jq build-essential