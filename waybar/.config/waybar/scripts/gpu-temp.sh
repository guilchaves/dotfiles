#!/bin/bash
# NVIDIA MX150 temperature. Skips nvidia-smi while the dGPU is runtime-suspended,
# since querying it would wake the card.
status=$(cat /sys/bus/pci/devices/0000:01:00.0/power/runtime_status 2>/dev/null)

if [ "$status" = "suspended" ]; then
  echo '{"text": "󰢮 off", "tooltip": "GPU suspended", "class": "suspended"}'
  exit 0
fi

temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits 2>/dev/null)

if [ -z "$temp" ]; then
  echo '{"text": "", "tooltip": "", "class": "unavailable"}'
  exit 0
fi

class=normal
[ "$temp" -ge 80 ] && class=critical
echo "{\"text\": \"󰢮 ${temp}°\", \"tooltip\": \"GPU: ${temp}°C\", \"class\": \"$class\"}"
