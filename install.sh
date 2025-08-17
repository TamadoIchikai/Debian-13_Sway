sudo apt install alacritty light sway swaybg swayidle swayimg swaylock waybar wofi llvm fonts-font-awesome build-essential libpam0g-dev libxcb-xkb-dev xauth xserver-xorg brightnessctl lightdm lightdm-gtk-greeter jq autotiling curl wget gpg flatpak
mkdir -p ~/.config/sway/ ~/.config/waybar ~/.config/wofi 
sudo sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin
chezmoi init https://github.com/TamadoIchikai/Debian-13_Sway
chezmoi init --apply https://github.com/TamadoIchikai/Debian-13_Sway
sudo install -d -m 0755 /etc/apt/keyrings 
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
sudo apt-get update && sudo apt-get install firefox 
sudo apt install 
sudo systemctl enable lightdm
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub md.obsidian.Obsidian
sudo reboot
