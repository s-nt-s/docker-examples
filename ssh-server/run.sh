#!/bin/bash
cd "$(dirname "$0")"

source ../buildrm.sh

docker run -d -P --name "container_${NAME}" "${NAME}"
ssh root@localhost -p $(docker port "container_${NAME}" 22 | cut -d':' -f2)
