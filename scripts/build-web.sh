#!/usr/bin/env bash

export TAG=${TAG:-latest}
export IMAGE_REGISTRY=ghcr.io/appscodeci

docker buildx create \
    --name container \
    --driver=docker-container || true

docker build --push \
    --builder container --platform linux/amd64,linux/arm64 \
    -t {IMAGE_REGISTRY}/cadence-web:$TAG .
