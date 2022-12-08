#!/usr/bin/env bash
printf "襤 |"

case $BLOCK_BUTTON in
	1) notify-send "power 1" ;;
	2) notify-send "power 2" ;;
	3) notify-send "power 3" ;;
esac

