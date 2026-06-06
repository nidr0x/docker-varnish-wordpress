FROM alpine:3.23

LABEL maintainer="Carlos R <nidr0x@gmail.com>" \
      org.opencontainers.image.title="docker-varnish-wordpress" \
      org.opencontainers.image.description="Varnish container for WordPress deployments"

ENV VARNISH_STORAGE="256m" \
    VARNISH_BACKEND_HOST="172.17.42.1" \
    VARNISH_BACKEND_PORT="80" \
    VARNISH_PORT="6081"

RUN apk add --no-cache varnish

COPY varnish.vcl /etc/varnish/default.vcl.template
COPY start.sh /start.sh

EXPOSE 6081

CMD ["/start.sh"]
