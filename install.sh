sudo apt install alacritty light sway swaybg swayidle swayimg swaylock waybar wofi llvm fonts-font-awesome build-essential libpam0g-dev libxcb-xkb-dev xauth xserver-xorg brightnessctl jq autotiling curl wget gpg flatpak meson ninja-build libcairo2-dev libpango1.0-dev libglib2.0-dev libgdk-pixbuf2.0-dev libxkbcommon-dev flex bison wayland-protocols libwayland-dev
mkdir -p ~/.config/sway/ ~/.config/waybar ~/.config/rofi
git clone https://github.com/davatorium/rofi.git ~/Downloads/Systems/
meson setup ~/Downloads/Systems/rofi/build ~/Downloads/Systems/rofi -Dwayland=enabled -Dxcb=disabled
sudo ninja -C ~/Downloads/Systems/rofi/build
rm -rf ~/Downloads/Systems/rofi
sudo sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin
chezmoi init https://github.com/TamadoIchikai/Debian-13_Sway
chezmoi init --apply https://github.com/TamadoIchikai/Debian-13_Sway
sudo install -d -m 0755 /etc/apt/keyrings 
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
sudo apt-get update && sudo apt-get install firefox 
sudo apt install 
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub md.obsidian.Obsidian
sudo reboot
