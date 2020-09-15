#!/bin/bash

if [ -z "$HTTP_PROXY" ]; then
  echo "FAIL: HTTP_PROXY is empty"
  exit 1
fi

echo "Configuration:"
echo "HTTP_PROXY=$HTTP_PROXY"
PROXY=$(echo "$HTTP_PROXY" | cut -d/ -f 3)
PROXY_SERVER=$(echo "$PROXY" | cut -d: -f 1)
PROXY_PORT=$(echo "$PROXY" | cut -d: -f 2)
echo "PROXY_SERVER=$PROXY_SERVER"
echo "PROXY_PORT=$PROXY_PORT"

echo "Setting config variables"
sed -i "s/vPROXY-SERVER/$PROXY_SERVER/g" /etc/redsocks.conf
sed -i "s/vPROXY-PORT/$PROXY_PORT/g" /etc/redsocks.conf
cat /etc/redsocks.conf

echo "Restarting redsocks and redirecting traffic via iptables"
/etc/init.d/redsocks restart
iptables -t nat -A OUTPUT  -p tcp --dport 5432 -j REDIRECT --to-port 12345

sleep 30

# Run app
python3 postgresql.py
