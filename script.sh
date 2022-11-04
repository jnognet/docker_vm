#/bin/env bash
sudo apt update -y && sudo apt upgrade -y
find  /home/vagrant/scripts/ -type f -name "*.sh"  | xargs chmod +x
