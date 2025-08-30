sudo apt install alacritty light sway swaybg swayidle swayimg waybar llvm fonts-font-awesome build-essential libpam0g-dev libxcb-xkb-dev xauth xserver-xorg brightnessctl jq autotiling curl wget gpg flatpak meson ninja-build libcairo2-dev libpango1.0-dev libglib2.0-dev libgdk-pixbuf2.0-dev libxkbcommon-dev flex bison wayland-protocols libwayland-dev gawk rofi libqalculate-dev qalc unzip dolphin konsole kio-extras kde-spectacle qt5ct kvantum vlc pipewire-audio wireplumber pipewire-pulse pipewire-jack libspa-0.2-bluetooth xdg-desktop-portal xdg-desktop-portal-wlr slurp copyq wl-clipboard grim wtype swappy fuzzel scdoc gtklock
mkdir -p ~/.config/sway/ ~/.config/waybar ~/.config/rofi ~/Downloads/Systems ~/.local/bin ~/.config/swappy
systemctl --user mask pulseaudio.service pulseaudio.socket
systemctl --user --now enable pipewire pipewire-pulse wireplumber.service
git clone https://github.com/svenstaro/rofi-calc.git
cd rofi-calc/
meson setup build
cd build
ninja
sudo ninja install
rm -rf rofi-calc/
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git ~/Downloads/Systems/
make -C ble.sh install PREFIX=~/.local
echo 'source -- ~/.local/share/blesh/ble.sh' >> ~/.bashrc
sudo sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin
chezmoi init https://github.com/TamadoIchikai/Debian-13_Sway
chezmoi init --apply https://github.com/TamadoIchikai/Debian-13_Sway
sudo install -d -m 0755 /etc/apt/keyrings 
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
sudo apt-get update && sudo apt-get install firefox 
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget -O JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
unzip JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -fv
cd
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub md.obsidian.Obsidian
flatpak install flathub io.missioncenter.MissionCenter
flatpak override --user --socket=system-bus org.missioncenter.MissionCenter
sudo reboot
