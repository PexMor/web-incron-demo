#!/bin/bash

# Install packets that are needed
apt-get -y update
apt-get -y dist-upgrade

apt-get -y purge mosquitto
apt-add-repository -y ppa:mosquitto-dev/mosquitto-ppa
apt-get -y update
apt-get -y install mosquitto
