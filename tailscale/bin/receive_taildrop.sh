#!/bin/sh

# Read the Taildrop directory path from the file
TAILDROP_DIR=$(cat /mnt/us/extensions/tailscale/config/tailscale_dir.txt)

# Receive files via Taildrop
kh_msg "Receiving Taildrop files..."
/mnt/us/extensions/tailscale/bin/tailscale file get "$TAILDROP_DIR"

if [ $? -eq 0 ]; then
    kh_msg "Taildrop files received successfully. Check the Taildrop folder at $TAILDROP_DIR."
else
    kh_msg "Failed to receive Taildrop files. Please check the connection."
fi
