FROM debian:trixie

LABEL maintainer="Jon X <ousiax@hotmail.com>"

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        bash-completion \
        curl \
        ethtool \
        iproute2 \
        iputils-ping \
        jq \
        dnsutils \
        netcat-openbsd \
        net-tools \
        nmap \
        telnet \
        tcpdump \
        traceroute \
        wget \
    && rm -rf /var/lib/apt/lists/*
