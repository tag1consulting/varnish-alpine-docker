FROM alpine:3.7
ENV VARNISH_BACKEND_ADDRESS 127.0.0.7
ENV VARNISH_MEMORY 100M
ENV VARNISH_BACKEND_PORT 8080

RUN apk update && \
    apk upgrade && \
    apk add varnish && \
    apk add git && \
    apk add build-base && \
    apk add automake && \
    apk add autoconf && \
    apk add libtool && \
    apk add python && \
    apk add py-docutils && \
    apk add varnish-libs && \
    apk add varnish-dev && \
    apk add bash

WORKDIR /opt
COPY varnish-modules varnish-modules	
WORKDIR /opt/varnish-modules

RUN chmod +x bootstrap && \
    ./bootstrap && \   
    ./configure && \
    make && \ 
    make install 

WORKDIR /opt

ADD start.sh /start.sh
CMD ["/start.sh"]
