FROM ubuntu

LABEL sh.demyx.image demyx/utilities
LABEL sh.demyx.maintainer Demyx <info@demyx.sh>
LABEL sh.demyx.url https://demyx.sh
LABEL sh.demyx.github https://github.com/demyxco
LABEL sh.demyx.registry https://hub.docker.com/u/demyx

# Install custom packages
RUN set -ex; \
    apt-get update && apt-get install -y --no-install-recommends \
    bash \
    jq \
    curl \
    ca-certificates \
    pv \
    pwgen \
    gpw \
    dnsutils \
    uuid-runtime \
    git \
    bsdmainutils \
    less \
    apache2-utils \
    dumb-init \
    nano \
    clamav \
    clamdscan \
    net-tools; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
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

# Create demyx user
RUN set -ex; \
    groupadd --gid 1000 demyx; \
    useradd --uid 1000 --gid demyx demyx

# Copy files
COPY bin/chroot.sh /usr/bin/demyx-chroot
COPY bin/maldet.sh /usr/bin/demyx-maldet
COPY bin/port.sh /usr/bin/demyx-port
COPY bin/proxy.sh /usr/bin/demyx-proxy
COPY bin/table.sh /usr/bin/demyx-table

# Finalize
RUN set -ex ; \
    chmod +x /usr/bin/demyx-chroot; \
    chmod +x /usr/bin/demyx-maldet; \
    chmod +x /usr/bin/demyx-port; \
    chmod +x /usr/bin/demyx-proxy; \
    chmod +x /usr/bin/demyx-table

USER demyx

ENTRYPOINT ["dumb-init", "bash", "-c"]
