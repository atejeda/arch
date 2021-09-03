#!/usr/bin/env bash

#pulsemixer
#pavucontrol-qt

printf $(pamixer --get-volume-human | sed "s/%//")
