#!/bin/sh
if [[ -z "${SCRIPT_URL}" ]]; then
    cat "${SCRIPT_PATH}" | sh
else
    curl -sS -X GET "${SCRIPT_URL}" | sh
fi
