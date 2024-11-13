#!/bin/sh

# Define directory for Taildrop files
TAILDROP_DIR="/mnt/us/extensions/tailscale/Taildrop"

# Receive files via Taildrop
kh_msg "Receiving Taildrop files..."
/mnt/us/extensions/tailscale/bin/tailscale file get .

if [ $? -eq 0 ]; then
    kh_msg "Taildrop files received successfully. Check the Taildrop folder."
else
    kh_msg "Failed to receive Taildrop files. Please check the connection."
fi
