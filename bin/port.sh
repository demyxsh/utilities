#!/bin/bash
# Demyx
# https://demyx.sh

while true; do
DEMYX_UTILITIES_PORT_CHECK=$(netstat -tupln 2>/dev/null | grep :"$DEMYX_UTILITIES_PORT" || true)
    if [[ -z "$DEMYX_UTILITIES_PORT_CHECK" ]]; then
        break
    else
        DEMYX_UTILITIES_PORT="$((DEMYX_UTILITIES_PORT+1))"
    fi
done
echo "$DEMYX_UTILITIES_PORT"
