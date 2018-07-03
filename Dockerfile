FROM alpine:3.7
ENV VARNISH_BACKEND_ADDRESS 127.0.0.7
ENV VARNISH_MEMORY 100M
ENV VARNISH_BACKEND_PORT 8080

RUN apk update && \
    apk upgrade && \
    apk add varnish

ADD start.sh /start.sh
CMD ["/start.sh"]
