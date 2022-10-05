FROM alpine

ARG VERSION

# COPY ./install.sh /tmp/install.sh

# RUN apk add --no-cache curl mariadb-client bash tzdata unzip fuse bzip2 && \
#     export envsubst_VERSION="${VERSION}" && \
#     bash /tmp/install.sh && \
#     rm /tmp/install.sh && \
#     adduser --disabled-password envsubst && \
#     curl https://rclone.org/install.sh | bash && \
#     apk del unzip bash curl bzip2

RUN apk add curl && \
    curl -L https://github.com/a8m/envsubst/releases/download/v${VERSION}/envsubst-`uname -s`-`uname -m` -o envsubst && \
    chmod +x envsubst && \
    mv envsubst /usr/local/bin && \
    apk del curl 

# USER envsubst

ENTRYPOINT [ "envsubst" ]