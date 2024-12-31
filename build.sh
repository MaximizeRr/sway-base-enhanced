#!/bin/bash
BUILD_OPTS="--rechunk --rechunk-clear-plan"
BUILD_OPTS=""
sudo bluebuild build --tempdir /mnt/samba/tmp --build-driver buildah -c zstd ${BUILD_OPTS} recipes/base.yml && \
  sudo buildah tag localhost/sway-aura:latest git.internal.myceliu.me/azure/sway-aura:latest && \ 
  sudo buildah push git.internal.myceliu.me/azure/sway-aura:latest
