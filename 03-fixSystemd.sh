#!/bin/bash

source $HOME/00-colors.sh

cd /lib/systemd/system/sysinit.target.wants/

ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1

rm -f /lib/systemd/system/multi-user.target.wants/*
rm -f /etc/systemd/system/*.wants/*
rm -f /lib/systemd/system/local-fs.target.wants/*
rm -f /lib/systemd/system/sockets.target.wants/*udev*
rm -f /lib/systemd/system/sockets.target.wants/*initctl*
rm -f /lib/systemd/system/basic.target.wants/*
rm -f /lib/systemd/system/anaconda.target.wants/*
rm -f /lib/systemd/system/plymouth*
rm -f /lib/systemd/system/systemd-update-utmp*

echo -ne "$Green"
echo -n "Green color"
echo -ne "$Blue"
echo -n " Blue color"
echo -ne "$Yellow"
echo -n " test"
echo -e "$Color_Off"

cat >/etc/mosquitto/conf.d/websock.conf <<DATA
# security restrictions for mqtt protocol
bind_address 127.0.0.1
port 1883

# besides localhost listen also on vpn address
# listener 1883 192.168.1.34

# due to issue websocket cannot be bound to ip address
# has to be protected by firewall
# version 1.4.9 should have fixed this:
# https://github.com/eclipse/mosquitto/issues/170
listener 9001 127.0.0.1
protocol websockets

password_file /etc/mosquitto/mosquitto.pwd
DATA

echo -n >/etc/mosquitto/mosquitto.pwd
mosquitto_passwd -b /etc/mosquitto/mosquitto.pwd web pass

