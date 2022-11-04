#/bin/env bash
set -o xtrace

docker ps -a
read -p ""
container=`docker container ls -l | grep -v CONTAINER | awk '{print $1}'`
[[ ! -z $container ]] && docker inspect $container | less
[[ ! -z $container ]] && docker container rm -f $container
read -p ""
docker ps -a
docker image ls
docker system df
