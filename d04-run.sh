#!/bin/bash

sudo docker run \
    -it \
    --rm \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    --cap-add SYS_ADMIN --security-opt seccomp=unconfined \
    -h test01 \
    --name test01 \
    xlinux/web-incron-demo
