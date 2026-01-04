#!/system/bin/sh
# Clear Optimization Module - Uninstaller
# Author: @revanthsaii
# License: MIT

# Log file path used by service.sh
LOG_FILE="/storage/emulated/0/Android/ClearOpt_log.txt"

# Remove the log file if it exists
if [ -f "$LOG_FILE" ]; then
  rm -f "$LOG_FILE"
fi

# Magisk/KSU handles the removal of the module directory itself.