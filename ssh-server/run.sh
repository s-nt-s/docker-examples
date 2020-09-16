#!/bin/bash
cd "$(dirname "$0")"

source ../buildrm.sh

docker run -d -P --name "container_${NAME}" "${NAME}"
PORT=$(docker port "container_${NAME}" 22 | cut -d':' -f2)
ssh-keygen -f "$HOME/.ssh/known_hosts" -R "[localhost]:${PORT}"
ssh root@localhost -p $PORT
