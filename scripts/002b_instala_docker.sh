#/bin/env bash

sudo apt install docker.io docker-compose -y
sudo systemctl start docker
sudo systemctl enable docker
