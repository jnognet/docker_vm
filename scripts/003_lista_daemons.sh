#/bin/env bash
set -o xtrace

systemctl status docker
systemctl status containerd
