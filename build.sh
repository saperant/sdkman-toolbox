#!/bin/bash

set -x

FEDORA_VERSION=${FEDORA_VERSION:-38}
podman build \
       -t sdkman-toolbox:$FEDORA_VERSION  \
       --build-arg=FEDORA_VERSION=$FEDORA_VERSION \
       --build-arg=BUILD_DATE="$(date  --rfc-3339=seconds)" \
       --build-arg VCS_REF="$(git rev-parse HEAD)" \
       .
