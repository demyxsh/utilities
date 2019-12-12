FROM debian:buster-slim

LABEL sh.demyx.image demyx/utilities
LABEL sh.demyx.maintainer Demyx <info@demyx.sh>
LABEL sh.demyx.url https://demyx.sh
LABEL sh.demyx.github https://github.com/demyxco
LABEL sh.demyx.registry https://hub.docker.com/u/demyx

# Set default variables
ENV UTILITIES_ROOT=/demyx
ENV UTILITIES_CONFIG=/etc/demyx
ENV UTILITIES_LOG=/var/log/demyx
ENV TZ America/Los_Angeles

# Configure Demyx
RUN set -ex; \
    adduser --gecos '' --disabled-password demyx; \
    \
    install -d -m 0755 -o demyx -g demyx "$UTILITIES_ROOT"; \
    install -d -m 0755 -o demyx -g demyx "$UTILITIES_CONFIG"; \
    install -d -m 0755 -o demyx -g demyx "$UTILITIES_LOG"

# Install custom packages
RUN set -ex; \
    apt-get update && apt-get install -y --no-install-recommends \
    apache2-utils \
    bash \
    bsdmainutils \
    ca-certificates \
    clamav \
    clamdscan \
    curl \
    dnsutils \
    git \
    gpw \
    jq \
    less \
    nano \
    net-tools \
    pv \
    pwgen \
    tzdata \
    uuid-runtime; \
    \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    \
    rm -rf /var/lib/apt/lists/*

# Install and configure maldet
RUN set -ex; \
    cd /tmp; \
    curl -O http://www.rfxn.com/downloads/maldetect-current.tar.gz; \
    tar -xzf maldetect-current.tar.gz; \
    rm maldetect-current.tar.gz; \
    cd $(ls /tmp); \
    bash install.sh; \
    sed -i 's/scan_ignore_root="1"/scan_ignore_root="0"/g' /usr/local/maldetect/conf.maldet; \
    freshclam; \
    maldet -u; \
    rm -rf /tmp/*

# Copy files
COPY bin "$UTILITIES_CONFIG"

# Finalize
RUN set -ex ; \
    mv "$UTILITIES_CONFIG"/chroot.sh /usr/bin/demyx-chroot; \
    chmod +x /usr/bin/demyx-chroot; \
    \
    mv "$UTILITIES_CONFIG"/maldet.sh /usr/bin/demyx-maldet; \
    chmod +x /usr/bin/demyx-maldet; \
    \
    mv "$UTILITIES_CONFIG"/port.sh /usr/bin/demyx-port; \
    chmod +x /usr/bin/demyx-port; \
    \
    mv "$UTILITIES_CONFIG"/proxy.sh /usr/bin/demyx-proxy; \
    chmod +x /usr/bin/demyx-proxy; \
    \
    mv "$UTILITIES_CONFIG"/table.sh /usr/bin/demyx-table; \
    chmod +x /usr/bin/demyx-table

USER demyx
