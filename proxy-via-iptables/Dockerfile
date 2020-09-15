# https://medium.com/datadriveninvestor/how-to-transparently-use-a-proxy-with-any-application-docker-using-iptables-and-redsocks-b8301ddc4e1e

FROM python:3.6

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

ENV PROXY_SERVER=localhost
ENV PROXY_PORT=3128

RUN apt-get update
RUN apt-get upgrade -qy
RUN apt-get install iptables redsocks -qy
RUN pip install psycopg2

COPY redsocks.conf /etc/redsocks.conf
ENTRYPOINT /bin/bash init.sh
