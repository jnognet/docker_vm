#/bin/env bash                                                                                                         
                                                                                                                       
set -o xtrace                                                                                                          
                                                                                                                       
docker container rm -f mysql
docker container rm -f nginx
docker container rm -f apache
docker run --rm -d --name mysql -p 3306:3306 -v mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=senha mysql:8.0.31                       
docker ps -a                                                                                                           
docker system df                                                                                                       
docker image ls      
