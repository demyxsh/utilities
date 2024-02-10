FROM debian:bullseye-slim

LABEL sh.demyx.image        demyx/utilities
LABEL sh.demyx.maintainer   Demyx <info@demyx.sh>
LABEL sh.demyx.url          https://demyx.sh
LABEL sh.demyx.github       https://github.com/demyxsh
LABEL sh.demyx.registry     https://hub.docker.com/u/demyx

# Set default variables
ENV DEMYX                   /demyx
ENV DEMYX_CONFIG            /etc/demyx
ENV DEMYX_LOG               /var/log/demyx
ENV TERM                    linux
ENV TZ                      America/Los_Angeles
# Set default variables
ENV UTILITIES_CONFIG        "$DEMYX_CONFIG"
ENV UTILITIES_LOG           "$DEMYX_LOG"
ENV UTILITIES_ROOT          "$DEMYX"

# Packages
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
    netcat \
    net-tools \
    pv \
    pwgen \
    rsync \
    tzdata \
    uuid-runtime; \
    \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    \
    rm -rf /var/lib/apt/lists/*

# Configure Demyx
RUN set -ex; \
    # Create demyx user
    adduser --gecos '' --disabled-password demyx; \
    \
    # Create demyx directories
    install -d -m 0755 -o demyx -g demyx "$DEMYX"; \
    install -d -m 0755 -o demyx -g demyx "$DEMYX_CONFIG"; \
    install -d -m 0755 -o demyx -g demyx "$DEMYX_LOG"; \
    \
    # Update .bashrc
    echo 'PS1="$(whoami)@\h:\w \$ "' > /home/demyx/.bashrc; \
    echo 'PS1="$(whoami)@\h:\w \$ "' > /root/.bashrc

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

# Imports
COPY --chown=root:root bin /usr/local/bin

# Finalize
RUN set -ex ; \
    # Set ownership
    chown -R root:root /usr/local/bin

USER demyx
