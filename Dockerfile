FROM alpine

ARG VERSION

RUN apk add curl && \
    curl -L https://github.com/a8m/envsubst/releases/download/v${VERSION}/envsubst-`uname -s`-`uname -m` -o envsubst && \
    chmod +x envsubst && \
    mv envsubst /usr/local/bin && \
    adduser --disabled-password envsubst && \
    apk del curl 

USER envsubst

ENTRYPOINT [ "envsubst" ]