#!/bin/bash -x

source mqtt-cfg.inc

echo "Please after the command exexutes, type your message"
mosquitto_pub \
    -i bash_pub_$$ \
    -h "$HOST" \
    -p "$PORT" \
    -l \
    -t "$TOPIC" \
    -u "$USER" \
    -P "$PASS"
