#!/usr/bin/env bash

set -oue pipefail

curl -Lo /tmp/bluetui https://github.com/pythops/bluetui/releases/download/v0.6/bluetui-x86_64-linux-gnu
install -c -m 0755 /tmp/bluetui /usr/bin