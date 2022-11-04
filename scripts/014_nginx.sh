#/bin/env bash

set -o xtrace

docker container rm -f  nginx
docker run -d --name nginx -P nginx:1.22.1
docker ps -a
docker system df
docker image ls
