#!/bin/bash

# usage: ./android_wifi.sh on|off

# get the first running emulator id
DEVICE=$(adb devices | grep "emulator-" | awk '{print $1}' | head -n 1)

if [ -z "$DEVICE" ]; then
  echo "❌ No running emulator found"
  exit 1
fi

case "$1" in
  on)
    echo "✅ Enabling Wi-Fi on $DEVICE"
    adb -s "$DEVICE" shell svc wifi enable
    ;;
  off)
    echo "🚫 Disabling Wi-Fi on $DEVICE"
    adb -s "$DEVICE" shell svc wifi disable
    ;;
  *)
    echo "Usage: $0 {on|off}"
    exit 1
    ;;
esac
