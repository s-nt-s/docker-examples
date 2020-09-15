#!/bin/bash

if [ -z "$1" ]; then
  echo "Falta parámetro para conectar a la base de datos. Ejemplo":
  echo "$0 \"hosts db user pass\""
  exit 1
fi

NAME="proxy-via-iptables"
if ! docker image inspect "${NAME}:latest" >/dev/null 2>&1; then
  docker build  -t "${NAME}" .
fi
docker run --privileged -e "DB=${1}" "${NAME}:latest" 2>&1 | tee -a log.log
