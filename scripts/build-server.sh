#!/usr/bin/env bash

export TAG=${TAG:-master-auto-setup}
export IMAGE_REGISTRY=ghcr.io/appscodeci

docker buildx create \
    --name container \
    --driver=docker-container || true

docker build --push \
    --builder container --platform linux/amd64,linux/arm64 \
    --build-arg TARGET=auto-setup \
    -t ${IMAGE_REGISTRY}/cadence-server:$TAG .
