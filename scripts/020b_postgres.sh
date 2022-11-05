#/bin/env bash

set -o xtrace

docker container rm -f psql
docker container rm -f mysql
docker container rm -f nginx
docker container rm -f apache
docker run --rm -ti --name psql postgres:15.0-bullseye psql -h 10.0.2.15 -U postgres
docker ps -a
docker system df
docker image ls
