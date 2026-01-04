# CLEAR Android Optimizer

CLEAR is a **root-only** Android optimization module that removes junk files, stale caches, and unnecessary logs to reclaim storage and improve overall system responsiveness on Android 10 and above.

> ⚠️ This module is intended for advanced users with rooted devices. Use at your own risk.

***

## Features

- Dalvik cache cleanup for `/data/dalvik-cache/arm` and `/data/dalvik-cache/arm64` to improve app startup and runtime performance.
- System dropbox log removal from `/data/system/dropbox` to eliminate accumulated diagnostic logs.
- Temporary file deletion across `/data/cache` and `/data/local/tmp` to free unused storage.
- Tombstone log erasure in `/data/tombstones` to clear old crash reports and reduce clutter.
- Empty directory cleanup in `/storage/emulated/0/Android` (excluding `/Pictures`) to remove leftover app folders.
- Thumbnail cache clearing for `.thumbnail` and `.thumbnails` directories to optimize media storage usage.
- System and shader cache cleaning in `/data`, `/data/user_de`, `/storage/emulated/0/Android/data`, and `/cache` to refresh graphics and app caches.
- FSTRIM-based partition optimization on `/data`, `/cache`, `/system`, `/vendor`, `/product`, `/metadata`, `/persist`, and `/apex` to enhance I/O performance.
- RAM cache clearing using `drop_caches` to free memory and improve system responsiveness.
- All-in-one optimization routine to run all supported cleanup and optimization tasks in a single pass with notifications.

***

## Requirements

- Rooted Android device (Magisk, APatch, SukiSU, KernelSU, or compatible solution).
- Minimum Android version: 10 (SDK 29).

***

## Installation

1. Download the latest CLEAR module ZIP from the releases section.
2. Flash/install the ZIP via:
   - Magisk Manager  
   - KernelSU  
   - APatch or another supported root solution
3. Reboot your device after installation.

***

## Usage

- Via terminal (e.g., Termux):

```bash
su -c CLEAR
```

This invokes the CLEAR optimization routine and executes the configured cleanup and trim operations.

***

## Warnings & Disclaimer

- This module is provided **as is**, without any warranty. All usage risks are your responsibility.
- CLEAR modifies system-related caches, logs, and partitions; improper use or incompatible environments may cause instability, performance regression, or bootloops.
- Always ensure you have:
  - A working custom recovery (e.g., TWRP) or ADB access.  
  - A recent backup of important data and configuration.

The developer is not liable for any damage, data loss, or malfunctions resulting from installation or use of this module.

***

## License

This project is licensed under the MIT License. See the [`LICENSE`](LICENSE) file for details.

***

## Support

If you find CLEAR helpful, consider starring the repository and sharing feedback or issues through GitHub.
