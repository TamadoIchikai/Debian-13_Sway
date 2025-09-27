# Description
- This is my github repo for debian 13 + Sway setup, this including config files, scripts and install.sh file for newly created machine
# Install
- When firsly boot into debian 
```bash
sudo apt install git neovim zsh
sudo sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin
chezmoi init https://github.com/TamadoIchikai/Debian-13_Sway
chezmoi init --apply https://github.com/TamadoIchikai/Debian-13_Sway
sudo chsh -s $(which zsh)
```

- Then go to installSH directory to install
```bash
sudo ./.config/installSH/install.sh
```

# Network issues
- After rebooted, for the wifi applet to work, we need to disable default systemd-network and debian default wifi
```bash
sudo systemctl disable --now systemd-networkd
sudo systemctl enable --now NetworkManager
nvim /etc/NetworkManager/NetworkManager.conf
```
At minimum, file should look like this: 
```conf
[main]
plugins=ifupdown,keyfile

[ifupdown]
managed=true
```
```bash
nvim /etc/network/interfaces
```
Then commented about all below `allow-hotplug`, eg:
```conf
#allow-hotplug wlo1
#iface wlo1 inet dhcp
#    wpa-ssid <wifi name>
#    wpa-psk <wifi-pass>
```
Then restart the process
```bash
sudo systemctl restart NetworkManager.service
sudo systemctl status NetworkManager.service
```
- If wifi still doesn't work then also killall wpa-supplicant process and restart the nm
```bash
sudo killall wpa_supplicant
sudo systemctl restart NetworkManager.service
sudo systemctl status NetworkManager.service
```
- If wifi still doesn't work then check if wifi radio (process) is turned on
```bash
nmcli radio all
```
-> WIFI must be enabled, if not then: 
```bash
nmcli radio wifi on
nmcli radio all
```
- Then restart the process
