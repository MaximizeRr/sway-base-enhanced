#!/bin/bash

sudo bluebuild build --tempdir /mnt/samba/tmp --build-driver buildah -c zstd --rechunk-clear-plan recipes/base.yml && \
  sudo buildah tag localhost/sway-aura:latest git.internal.myceliu.me/azure/sway-aura:latest && \ 
  sudo buildah push git.internal.myceliu.me/azure/sway-aura:latest
