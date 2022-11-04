#/bin/env bash

echo "
	Management Commands:
	builder     Manage builds   
	compose*    Docker Compose (Docker Inc., v2.12.2)
        container   Manage containers
        image       Manage images
        network     Manage networks
        system      Manage Docker
        volume      Manage volumes 
	
"

set -o xtrace

docker container ls -a

docker image ls

docker network ls

docker volume ls
