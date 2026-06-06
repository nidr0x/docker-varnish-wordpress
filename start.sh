#!/bin/sh

set -eu

if [ -z "${VARNISH_BACKEND_HOST:-}" ]; then
    echo "ERROR: VARNISH_BACKEND_HOST must be set."
    exit 1
fi

if [ -z "${VARNISH_BACKEND_PORT:-}" ]; then
    echo "ERROR: VARNISH_BACKEND_PORT must be set."
    exit 1
fi

rendered_vcl="/tmp/default.vcl"
cp /etc/varnish/default.vcl.template "${rendered_vcl}"

sed -i "s|\${VARNISH_BACKEND_HOST}|${VARNISH_BACKEND_HOST}|g" "${rendered_vcl}"
sed -i "s|\${VARNISH_BACKEND_PORT}|${VARNISH_BACKEND_PORT}|g" "${rendered_vcl}"

echo "Using at most ${VARNISH_STORAGE} of RAM for cache."
echo "Listening on port ${VARNISH_PORT}."
echo "Using backend http://${VARNISH_BACKEND_HOST}:${VARNISH_BACKEND_PORT}."

exec varnishd -F \
    -f "${rendered_vcl}" \
    -s "malloc,${VARNISH_STORAGE}" \
    -a "0.0.0.0:${VARNISH_PORT}"
