FROM alpine:3.11
LABEL Maintainer="Carlos R <nidr0x@gmail.com>" \
          Description="Varnish container in Alpine Linux"

ENV VARNISH_STORAGE "256m"
ENV VARNISH_BACKEND_HOST "172.17.42.1"
ENV VARNISH_BACKEND_PORT "80"

ADD varnish.vcl /etc/varnish/varnish.vcl

RUN set -xe \ 
    && apk add --no-cache varnish=6.3.1-r1

EXPOSE 6081 

ADD start.sh /start.sh
CMD ["/start.sh"]
