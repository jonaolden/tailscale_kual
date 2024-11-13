#!/bin/sh
# Read the auth key from auth_key.txt if it exists
AUTH_KEY_FILE="/mnt/us/extensions/tailscale/config/auth_key.txt"
if [ -f "$AUTH_KEY_FILE" ]; then
    AUTH_KEY=$(cat "$AUTH_KEY_FILE")
    /mnt/us/extensions/tailscale/bin/tailscale up --auth-key="$AUTH_KEY" > tailscale_start_log.txt 2>&1
else
    /mnt/us/extensions/tailscale/bin/tailscale up > tailscale_start_log.txt 2>&1
fi

kh_msg "$(cat tailscale_start_log.txt)"
