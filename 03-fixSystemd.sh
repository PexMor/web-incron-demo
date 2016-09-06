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
echo -n "Green color test"
echo -ne "$Blue"
echo -n "Green color test"
echo -e "$Color_Off"
