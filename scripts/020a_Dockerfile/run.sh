#/bin/env bash
set -o xtrace

docker build -t app-test:1.0 .

docker container rm -f  nginx
docker run -d --name nginx -p 80:80 app-test:1.0
docker ps -a
docker system df
docker image ls
