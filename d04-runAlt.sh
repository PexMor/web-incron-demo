#!/bin/bash

# -v /sys/fs/cgroup:/sys/fs/cgroup:ro \

VOLS="-v /sys/fs/cgroup:/sys/fs/cgroup:ro"
OPTS="--cap-add SYS_ADMIN --security-opt seccomp=unconfined"
# OPTS="--privileged"

sudo docker run \
    -it \
    --rm \
    $VOLS \
    $OPTS \
    -h test01 \
    --name test01 \
    test01 \

#    systemd.unit=emergency.service
