#!/bin/bash 
set -e 
echo Initializing...

echo Test Dynamic Conf

if [[ -z "${DYNAMIC_CONF}" ]]; then 
    echo Using default conf or mapped by volume
else
    echo Using Dynamic Configuration
    echo NGINX CONF URL = $DYNAMIC_CONF
	curl -o /etc/nginx/nginx.conf "$DYNAMIC_CONF"
fi 

echo Starting NGINX

exec "$@"