ARG BUILD_FROM
FROM $BUILD_FROM
ARG BUILD_ARCH

MAINTAINER 5310H
ENV LANG C.UTF-8
RUN apk add --no-cache libc6-compat
RUN apk add --no-cache jq
RUN apk add --no-cache wget

RUN \
    if [ "${BUILD_ARCH}" = "amd64" ]; then \
        wget -O /usr/local/bin/infinitive https://github.com/acd/infinitive/releases/download/v0.2/infinitive.amd64; \
    else \
        wget -O /usr/local/bin/infinitive https://github.com/acd/infinitive/releases/download/v0.2/infinitive.arm; \
    fi

COPY data/run.sh /run.sh
RUN chmod a+x /usr/local/bin/infinitive
RUN chmod a+x /run.sh

#RUN export GIN_MODE=release
#ENTRYPOINT [ "infinitive", "-httpport=8081", "-serial=/dev/ttyUSB0" ]

WORKDIR /
CMD [ "/run.sh" ]
