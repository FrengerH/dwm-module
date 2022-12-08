#!/usr/bin/env bash
printf "襤 |"

case $BLOCK_BUTTON in
	1) notify-send "power2 1" ;;
	2) notify-send "power2 2" ;;
	3) notify-send "power2 3" ;;
esac

