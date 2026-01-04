#!/system/bin/sh
# Clear Optimization Module - Installation Script
# Author: @revan
# License: MIT

SKIPUNZIP=1

# Print with UI
ui_print() {
    echo "$1"
}

# Installation process
ui_print " "
ui_print "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
ui_print "  Clear Optimization Module v1.0.0  "
ui_print "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
ui_print " "

# Get Android API level
API=$(getprop ro.build.version.sdk)
ABI=$(getprop ro.product.cpu.abi)

ui_print "• Checking device compatibility..."
ui_print "  - Android API: $API"
ui_print "  - Architecture: $ABI"

# Check minimum Android version (API 29 = Android 10)
if [ "$API" -lt 29 ]; then
    ui_print " "
    ui_print "✗ ERROR: Android 10 or higher required!"
    ui_print "  Current: Android API $API"
    exit 1
fi

# Check architecture (arm64-v8a)
case "$ABI" in
    arm64-v8a|arm64)
        ui_print "✓ Architecture supported"
        ;;
    *)
        ui_print " "
        ui_print "✗ ERROR: Only arm64-v8a devices supported!"
        ui_print "  Your device: $ABI"
        exit 1
        ;;
esac

ui_print " "
ui_print "• Installing module files..."

# Extract module files
unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
unzip -o "$ZIPFILE" 'service.sh' -d $MODPATH >&2
unzip -o "$ZIPFILE" 'uninstall.sh' -d $MODPATH >&2

ui_print "✓ Module files installed"
ui_print " "

# Set permissions
ui_print "• Setting permissions..."
set_perm_recursive $MODPATH 0 0 0755 0644
set_perm $MODPATH/service.sh 0 0 0755
set_perm $MODPATH/uninstall.sh 0 0 0755

if [ -d "$MODPATH/system/bin" ]; then
    set_perm_recursive $MODPATH/system/bin 0 0 0755 0755
fi

ui_print "✓ Permissions configured"
ui_print " "

# Installation complete
ui_print "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
ui_print "  Installation Successful! ✓        "
ui_print "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
ui_print " "
ui_print "• Reboot your device to activate"
ui_print "• Run optimization via Termux:"
ui_print "  su -c CLEAR"
ui_print " "
ui_print "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"