#/bin/env bash
set -o xtrace

docker system prune -a -f --volumes
docker ps -a
docker image ls
docker system df
