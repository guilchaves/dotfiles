#!/bin/bash
# Stand-in for omarchy's power menu (omarchy-menu power)
choice=$(printf '󰍁  Lock\n󰗼  Logout\n󰜉  Reboot\n⏻  Shutdown\n' | wofi --dmenu --prompt Power --width 220 --height 200)

case "$choice" in
  *Lock) hyprlock ;;
  *Logout) hyprctl dispatch exit ;;
  *Reboot) systemctl reboot ;;
  *Shutdown) systemctl poweroff ;;
esac
