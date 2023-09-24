#!/bin/bash

CURRENT_IP=$(ip -6 addr show "$NETWORK_DEVICE" | grep "scope global" | grep -v "deprecated" | grep "$IP_ADDRESS_FILTER" | grep -oP '(?<=inet6\s)[\da-f:]+\/\d+')
IPV6_PREFIX=$(echo "$CURRENT_IP" | cut -d ' ' -f 2 | cut -d '/' -f 1 | cut -d ':' -f 1-4)
/src/main.py "$INPUT_FILE" "$MIDDLEWARE_NAME" "$IPV6_PREFIX::/64"
