#!/bin/bash
# Demyx
# https://demyx.sh

DEMYX_MALDET_TYPE="$1"

if [[ "$DEMYX_MALDET_TYPE" = db ]]; then
    DEMYX_MALDET_SCAN=$(maldet -a "${MALDET_MARIADB_PATH:-/demyx}" | grep "to view run" | awk '{print $NF}')
else 
    DEMYX_MALDET_SCAN=$(maldet -a "${MALDET_WORDPRESS_PATH:-/demyx}" | grep "to view run" | awk '{print $NF}')
fi

maldet --report "$DEMYX_MALDET_SCAN"
