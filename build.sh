#!/bin/bash

VERSION="1.2.0"

docker buildx create --name my
docker buildx use my

docker buildx build --build-arg VERSION=${VERSION} --platform linux/amd64,linux/arm64,linux/arm/v7 -t  .