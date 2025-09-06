echo "creating basic directories"
~/Downloads/Systems ~/.local/bin

echo "install chezmoi for config file setup"
sudo sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin
chezmoi init https://github.com/TamadoIchikai/Debian-13_Sway
chezmoi init --apply https://github.com/TamadoIchikai/Debian-13_Sway

echo "install basic utils and libs"
sudo apt install scdoc gawk flex bison brightnessctl  llvm build-essential xauth xserver-xorg xdg-desktop-portal xdg-desktop-portal-wlr 
sudo apt install libcairo2-dev libpango1.0-dev libglib2.0-dev libgdk-pixbuf2.0-dev libxkbcommon-dev libwayland-dev libpam0g-dev libxcb-xkb-dev 

echo "Installing audio and video configuration stuff"
sudo apt install vlc mpv-mpris playerctl pipewire-audio wireplumber pipewire-pulse pipewire-jack libspa-0.2-bluetooth 

echo "change pulseaudio service to pipewire service"
systemctl --user mask pulseaudio.service pulseaudio.socket
systemctl --user --now enable pipewire pipewire-pulse wireplumber.service

echo "background and image viewer, alongside with screenshot tools"
sudo apt install swaybg swayimg slurp wl-clipboard grim wtype swappy

echo "install dolphin file manager"
sudo apt install dolphin kio-extras qt5ct kvantum

echo "application launcher and clipboard manager using fuzzel"
sudo apt install fuzzel

echo "build rofi-dev for quick calculation tool and powermenu"
sudo apt install libqalculate-dev qalc 
git clone https://github.com/davatorium/rofi.git ~/Downloads/Systems/
meson setup ~/Downloads/Systems/rofi/build ~/Downloads/Systems/rofi -Dwayland=enabled -Dxcb=disabled
sudo ninja -C ~/Downloads/Systems/rofi/build
cd
rm -rf ~/Downloads/Systems/rofi
git clone https://github.com/svenstaro/rofi-calc.git
cd rofi-calc/
meson setup build
cd build
ninja
sudo ninja install
cd
rm -rf rofi-calc/

echo "install nerd, awesome font alongside with papirus icon"
mkdir -p ~/.local/share/fonts
sudo apt install fonts-font-awesome papirus-icon-theme
cd ~/.local/share/fonts
wget -O JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/NerdFontsSymbolsOnly.zip
unzip NerdFontsSymbolsOnly.zip
unzip JetBrainsMono.zip
rm NerdFontsSymbolsOnly.zip
rm JetBrainsMono.zip
fc-cache -fv
cd

echo "install ble.sh for autocomple and suggestion"
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git ~/Downloads/Systems/
cd ~/Downloads/Systems/
make -C ble.sh install PREFIX=~/.local
echo 'source -- ~/.local/share/blesh/ble.sh' >> ~/.bashrc
cd

echo "install fcitx for vietnamese and japanese keyboard"
sudo apt install fcitx5 fcitx5-configtool fcitx5-frontend-gtk3 fcitx5-frontend-gtk4 fcitx5-frontend-qt6 fcitx5-unikey fcitx5-mozc

echo "install firefox"
sudo install -d -m 0755 /etc/apt/keyrings 
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
sudo apt-get update && sudo apt-get install firefox 

echo "install workstyle for waybar workspace icon"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
cargo install workstyle

echo "install flatpak related apps like obsidian, mission center"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub md.obsidian.Obsidian
flatpak install flathub io.missioncenter.MissionCenter
flatpak override --user --socket=system-bus org.missioncenter.MissionCenter

echo "OK all things done now, reboot"
sudo reboot
