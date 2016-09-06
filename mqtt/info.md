sudo aptitude purge mosquitto

sudo apt-add-repository ppa:mosquitto-dev/mosquitto-ppa
sudo apt-get update

sudo /etc/mosquitto/conf.d/websock.conf
listener 1883
listener 9001
protocol websockets
password_file mosquitto.pwd

sudo mosquitto_passwd -c mosquitto.pwd web

sudo service mosquitto restart

# enable apache a2enmod proxy_wstunnel
# ProxyPass /mqtt/mqtt  ws://172.20.30.86:9001/mqtt retry=10
