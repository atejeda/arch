#!/usr/bin/env bash

wifi_signal=$(
    iwconfig wlp1s0 \
    | grep Quality \
    | awk -F ' ' '{ gsub(/^[ \t]+|[ \t]+$/, ""); print $2 }' \
    | cut -d '=' -f2
)

wifi_signal=$(
    echo "scale=2; $wifi_signal" | bc 
)

printf "$wifi_signal"
