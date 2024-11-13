# Tailscale for Kindle (KUAL)
This (very very) simple repo integrates Kindle to your Tailscale network, allowing remote access and fileshare via Taildrop.


## Prerequisites:

1. Jailbroken Kindle. ([see](https://kindlemodding.gitbook.io/kindlemodding))
2. KUAL installed. ([see](https://kindlemodding.gitbook.io/kindlemodding/post-jailbreak/installing-kual-mrpi))
3. Pre-authentication key from Tailscale  ([see](https://tailscale.com/kb/1085/auth-keys))


## Usage:

1. Download the repository.
2. Get the latest tailscale binaries for the `arm` architecture from [here](https://pkgs.tailscale.com/stable/#static).
3. Place the `tailscale` and `tailscaled` binaries in the `tailscale/bin` folder of this (local) repository.
4. Place the tailscale folder into the `extensions` folder on your kindle.
5. Copy your auth-key from Tailscale into `tailscale/config/auth_key.txt`
6. (Optional) Set up custom Taildrop target folder by editing `tailscale/config/taildrop_dir.txt` (defaults to `tailscale/taildrop`)
7. In the KUAL menu, start `tailscaled` first then start `tailscale`.
10. After connecting the device should add the kindle to your `Machines` page on tailscale admin console. ([this](https://login.tailscale.com/admin/machines)).

## Taildrop:
1. Send file from source machine to target machine (Kindle)
2. In the KUAL menu, `Receive Taildrop Files` to trigger the transfer onto the Kindle.
3. Note files in your target folder (`tailscale/taildrop` by default)

## SSH:
Use the (static) IP address assigned by Tailscale for your machine to connect to kindle.
Note: Make sure the kindle screen is on, else the kindle sleeps the wifi. 

## To do: 
KOPlugin to start Tailscale and trigger Taildrop from KOReader UI. 
Since Tailscaled is idle it does not need to be restarted. A simple UI plugin to trigger `Start Tailscale` and 
`Receive Taildrop Files` should do. 
