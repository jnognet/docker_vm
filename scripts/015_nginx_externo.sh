#/bin/env bash

set -o xtrace

docker container rm -f  nginx
docker run -d --name nginx -p 80:80 nginx:1.22.1
docker ps -a
docker system df
docker image ls
