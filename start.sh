#!/bin/sh

[ -z "${VARNISH_BACKEND_HOST}"  ] && echo "ERROR: VARNISH_BACKEND_HOST must be set." && exit 1;
[ -z "${VARNISH_BACKEND_PORT}"  ] && echo "ERROR: VARNISH_BACKEND_PORT must be set." && exit 1;

echo "Using at most ${VARNISH_STORAGE} of RAM for cache."
echo "Using backend http://${VARNISH_BACKEND_HOST}:${VARNISH_BACKEND_PORT}."

for name in VARNISH_BACKEND_PORT VARNISH_BACKEND_HOST
do
    eval value=\$$name
    sed -i "s|\${${name}}|${value}|g" /etc/varnish/varnish.vcl
done

varnishd -f /etc/varnish/varnish.vcl -s malloc,${VARNISH_STORAGE} -a 0.0.0.0:${VARNISH_PORT}

sleep 1
varnishlog
