#/bin/env bash                                                                                                         
                                                                                                                       
set -o xtrace                                                                                                          
                                                                                                                       
docker container rm -f postgres
docker container rm -f mysql
docker container rm -f nginx
docker container rm -f apache
docker run --rm -d --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=senha postgres:15.0-bullseye
docker ps -a                                                                                                           
docker system df                                                                                                       
docker image ls      
