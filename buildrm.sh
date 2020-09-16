#!/bin/bash
NAME=$(basename $(realpath .))

if [ "$1" == "--rm" ]; then
  docker container stop "container_${NAME}"
  docker container rm "container_${NAME}"
  docker image rm "${NAME}"
  exit 0
elif [ "$1" == "--build" ]; then
  docker build -t "${NAME}" .
elif ! docker image inspect "${NAME}:latest" >/dev/null 2>&1;; then
  docker build -t "${NAME}" .
fi
