HOST=172.20.31.1
PORT=1883
TOPIC=$(grep topic= js-mqtt/topic.js | cut -d\" -f2)
echo TOPIC=$TOPIC
USER=web
PASS=pass