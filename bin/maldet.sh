#!/bin/bash
# Demyx
# https://demyx.sh
set -euo pipefail

DEMYX_MALDET_TYPE="${1:-wp}"

if [[ "$DEMYX_MALDET_TYPE" = db ]]; then
    DEMYX_MALDET_SCAN=$(maldet -a "${UTILITIES_ROOT:-/demyx}" | grep "to view run" | awk '{print $NF}')
else 
    DEMYX_MALDET_SCAN=$(maldet -a "${UTILITIES_ROOT:-/demyx}" | grep "to view run" | awk '{print $NF}')
fi

maldet --report "$DEMYX_MALDET_SCAN"
