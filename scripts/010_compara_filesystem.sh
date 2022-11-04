#/bin/env bash
set -o xtrace

sudo ls -laFR /var/lib/docker > /tmp/dockernow
diff /tmp/dockernow /tmp/dockerzero
