#!/bin/bash -x

source mqtt-cfg.inc

echo "After the commands starts you will see messages when they arrive on stdout"
mosquitto_sub \
    -i bash_sub_$$ \
    -h "$HOST" \
    -p "$PORT" \
    -t "$TOPIC" \
    -u "$USER" \
    -P "$PASS"

    #-l \
