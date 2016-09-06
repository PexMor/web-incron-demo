# web-incron-demo

Web Incron integration demo incl. docker sample

https://hub.docker.com/r/xlinux/web-incron-demo/

docker pull xlinux/web-incron-demo

# to 'just' run

```bash
#!/bin/bash

sudo docker run \
    -it \
    --rm \
    -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
    --cap-add SYS_ADMIN --security-opt seccomp=unconfined \
    -h test01 \
    --name test01 \
    xlinux/web-incron-demo
```

Packages:

 - todo: list here and explain
 - jq
 - curl
 - mc
 - openssl
 - redis-cli
 - links
 - tftp

Servers:

 - Apache
 - Redis
 - Beanstalkd
 - Mosquitto
 - Incron
 - Squid3