#!/bin/bash
cd "$(dirname "$0")"

if [ -z "$1" ]; then
  echo "Falta parámetro para conectar a la base de datos. Ejemplo":
  echo "$0 \"hosts db user pass\""
  exit 1
fi

source ../buildrm.sh

docker run --privileged -e "DB=${1}" "${NAME}:latest" 2>&1 | tee -a log.log
