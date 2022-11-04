#/bin/env bash

set -o xtrace

docker container rm -f nginx
docker container rm -f apache
docker run -d --name apache -p 80:80 -v /vagrant:/usr/local/apache2/htdocs httpd:2.4.54-bullseye
docker ps -a
docker system df
docker image ls
