ARG BUILD_FROM
FROM $BUILD_FROM
ARG BUILD_ARCH

MAINTAINER 5310H
ENV LANG C.UTF-8
RUN apk add --no-cache libc6-compat
RUN apk add --no-cache jq
RUN apk add --no-cache wget

#RUN \
#    if [ "${BUILD_ARCH}" = "amd64" ]; then \
#        wget -O /usr/local/bin/infinitive https://github.com/5310h/ha_infinitive/data/ha_infinitive.amd64; \
#         COPY data/ha_infinitive.amd64 /usr/local/bin/infinitive
#    else \
#        wget -O /usr/local/bin/infinitive https://github.com/5310h/ha_infinitive/data/infinitive.arm; \
#    fi
COPY data/ha_infinitive.amd64 /usr/local/bin/infinitive
#COPY data/infinitive.arm /usr/local/bin/infinitive


COPY data/run.sh /run.sh
RUN chmod a+x /usr/local/bin/infinitive
RUN chmod a+x /run.sh

WORKDIR /
CMD [ "/run.sh" ]
