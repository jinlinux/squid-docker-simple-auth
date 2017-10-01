FROM alpine:latest
MAINTAINER Simon Tran <simon@linosec.lu>

RUN apk update \
    && apk add squid=3.5.23-r3 \
    && apk add curl \
    && apk add apache2-utils \
    && rm -rf /var/cache/apk/*
RUN mkdir /usr/etc
COPY squid.conf /etc/squid/squid.conf
EXPOSE 3128
VOLUME /var/log/squid
ADD init /init
CMD ["/init"]
