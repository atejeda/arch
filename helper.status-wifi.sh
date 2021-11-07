#!/usr/bin/env bash

wifi_interface=wlp1s0

wifi_signal=$(
    iwconfig $wifi_interface \
    | grep Quality \
    | awk -F ' ' '{ gsub(/^[ \t]+|[ \t]+$/, ""); print $2 }' \
    | cut -d '=' -f2
)

wifi_signal=$(
    echo "scale=2; $wifi_signal" | bc 
)

printf "$wifi_signal"
