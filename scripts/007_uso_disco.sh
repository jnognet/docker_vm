#/bin/env bash
set -o xtrace

docker system df
sudo ls -laF /var/lib/docker
[[ ! -f /tmp/dockerzero ]] && sudo ls -laFR /var/lib/docker > /tmp/dockerzero
