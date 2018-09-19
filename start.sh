#!/bin/bash

export VARNISH_LISTEN_PORT=80

# Starting services
echo "Starting Varnish"
varnishd -f /etc/varnish/default.vcl -s malloc,2G -a 0.0.0.0:${VARNISH_LISTEN_PORT} -p timeout_idle=15 -t 60 -F &

echo "Starting NGinx"
nginx

# Identify that is a container and lock the process if so
if [ -f /.dockerenv ]; then
    echo "Running in Docker!"
    tail -f /dev/null
fi
