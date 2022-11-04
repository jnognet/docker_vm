#/bin/env bash

set -o xtrace

docker container rm -f  busybox
docker run -ti --name busybox busybox:1.34.1 ping 8.8.8.8
docker ps -a
docker system df
docker system prune -a -f --volumes
docker ps -a
docker image ls
docker system df
