#!/system/bin/sh
# Clear Optimization Module - Background Service
# Author: @revanthsaii
# License: MIT

# Wait for boot to start
while [ "$(getprop sys.boot_completed)" != "1" ]; do
  sleep 10
done

# Wait a bit more to ensure system is settled
sleep 60

# Log start
LOG_FILE="/storage/emulated/0/Android/ClearOpt_log.txt"
echo "[$(date)] Service started: Clear Optimization v1.0.0" > "$LOG_FILE"

# 1. Optimize App Compilation (Background Dexopt)
echo "[$(date)] Running background compilation..." >> "$LOG_FILE"
cmd package bg-dexopt-job

# 2. Trim Filesystem (FSTRIM)
# Helps maintain flash storage performance
echo "[$(date)] Trimming filesystem..." >> "$LOG_FILE"
sm fstrim

# 3. Clear Package Cache (Safe)
# Only if the cache directory exists and is large
CACHE_DIR="/data/local/tmp"
if [ -d "$CACHE_DIR" ]; then
    echo "[$(date)] Cleaning local temp cache..." >> "$LOG_FILE"
    # Safely find and delete old temp files (older than 7 days)
    find "$CACHE_DIR" -type f -mtime +7 -delete 2>/dev/null
fi

echo "[$(date)] Optimization complete." >> "$LOG_FILE"