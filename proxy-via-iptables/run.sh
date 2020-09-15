#!/bin/bash

NAME="proxy-via-iptables"
if ! docker image inspect "${NAME}:latest" >/dev/null 2>&1; then
  docker build  -t "${NAME}" .
fi
docker run --privileged "${NAME}:latest" 2>&1 | tee -a log.log
