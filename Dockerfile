ARG FEDORA_VERSION
FROM registry.fedoraproject.org/fedora-toolbox:$FEDORA_VERSION

ARG BUILD_DATE
ARG VCS_REF
LABEL authoritative-source-url=ghcr.io \
      build-date="$BUILD_DATE" \
      maintainer="Saku Rantamäki <saku.rantamaki@iki.fi>" \
      name=saperant/sdkman-toolbox \
      summary="Toolbox container based on Fedora with SDKMAN installed" \
      url="https://github.com/saperant/sdkman-toolbox/" \
      usage="This image is meant to be used with the toolbox command" \
      vcs-ref="$VCS_REF" \
      vcs-url="https://github.com/saperant/sdkman-toolbox/"

RUN dnf -y update && \
    dnf -y install \
        vim \
        tmux \
        ranger && \
    dnf clean all

ENV SDKMAN_DIR=/usr/local/sdkman

RUN curl -s "https://get.sdkman.io?rcupdate=false" | bash

COPY sdkman.sh /etc/profile.d/sdkman.sh

