FROM ubuntu:latest

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    TEXLIVE_INSTALL_NO_CONTEXT_CACHE=1 \
    NOPERLDOC=1

RUN apt-get update && \
    apt-get install -qy --no-install-recommends \
    curl \
    ca-certificates \
    perl && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt/

WORKDIR /tmp
RUN curl -L http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz --output install-tl-unix.tar.gz && \
    tar xzf install-tl-unix.tar.gz --strip-components=1 && \
    ./install-tl -no-doc-install -no-src-install --no-interaction
