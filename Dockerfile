FROM alpine:3.11
LABEL maintainer "maiha <maiha@wota.jp>"

RUN echo "@edge http://mirror.xtom.com.hk/alpine/edge/main" >> /etc/apk/repositories
RUN apk --update add \
    automake \
    autoconf \
    g++ \
    make \
    libtool \
    openssl-dev@edge \
    openssl-libs-static@edge \
    libidn2-dev@edge \
    libidn2-static@edge \
    && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apk/*

CMD ["cat", "/etc/alpine-release"]
