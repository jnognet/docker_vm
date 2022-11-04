#/bin/env bash
set -o xtrace

docker container rm -f  nginx
docker system prune -a
docker ps -a
docker system df
docker image ls
