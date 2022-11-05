#/bin/env bash
set -o xtrace

docker container rm -f  nginx
docker ps -a
docker system df
docker image ls
