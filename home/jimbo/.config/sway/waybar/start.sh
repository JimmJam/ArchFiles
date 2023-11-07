#!/usr/bin/env bash
pkill waybar
waybar -c $waybarcfg/config -s $waybarcfg/style.css
