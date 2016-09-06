#!/bin/bash

cd $HOME
apt-get install -y $(cat packages2install.txt)
