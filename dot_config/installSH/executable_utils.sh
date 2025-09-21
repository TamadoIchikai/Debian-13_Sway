echo "creating basic directories"
mkdir -p ~/Downloads/Systems ~/.local/bin

echo "install nerd, awesome font alongside with papirus icon"
mkdir -p ~/.local/share/fonts
sudo apt install fonts-font-awesome papirus-icon-theme fonts-noto-cjk
cd ~/.local/share/fonts
wget -O JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/NerdFontsSymbolsOnly.zip
unzip NerdFontsSymbolsOnly.zip
unzip JetBrainsMono.zip
rm NerdFontsSymbolsOnly.zip
rm JetBrainsMono.zip
fc-cache -fv
cd

echo "install chezmoi for config file setup"
sudo sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin
chezmoi init https://github.com/TamadoIchikai/Debian-13_Sway
chezmoi init --apply https://github.com/TamadoIchikai/Debian-13_Sway

echo "install basic utils and libs"
sudo apt install scdoc fuse libfuse2t64 zenity gawk ufw cliphist flex bison brightnessctl cmake llvm build-essential xauth xserver-xorg xdg-desktop-portal xdg-desktop-portal-wlr 
sudo apt install libcairo2-dev libpango1.0-dev libglib2.0-dev libgdk-pixbuf-xlib-2.0-dev libxkbcommon-dev libwayland-dev libpam0g-dev libxcb-xkb-dev libglib2.0-bin libnotify-bin

echo "Installing audio and video configuration stuff"
sudo apt install vlc mpv-mpris playerctl pipewire-audio pavucontrol wireplumber pipewire-pulse pipewire-jack libspa-0.2-bluetooth 

echo "installing notification helper -> using swaync"
sudo apt install sway-notification-center

echo "installing bluetooth helper -> using blueman"
sudo apt install blueman


echo "change pulseaudio service to pipewire service"
systemctl --user mask pulseaudio.service pulseaudio.socket
systemctl --user --now enable pipewire pipewire-pulse wireplumber.service

echo "background and image viewer, alongside with screenshot tools"
sudo apt install swaybg swayimg slurp wl-clipboard grim wtype swappy

echo "install thunar file manager"
sudo apt install thunar thunar-archive-plugin thunar-volman gvfs lxappearance gsettings-desktop-schemas dconf-cli dconf-service
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'

echo "install code editor -> chosing zed editor now"
curl -f https://zed.dev/install.sh | sh

echo "application launcher and clipboard manager using fuzzel"
sudo apt install fuzzel

echo "build rofi-dev for quick calculation tool and powermenu"
sudo apt install libqalculate-dev qalc rofi-dev
git clone https://github.com/davatorium/rofi.git ~/Downloads/Systems/rofi
cd Downloads/Systems/rofi/
meson setup build -Dwayland=enabled -Dxcb=disabled
cd build/
sudo ninja build
git clone https://github.com/svenstaro/rofi-calc.git ~/Downloads/Systems/rofi-calc
cd ~/Downloads/Systems/rofi-calc
meson setup build
cd build
ninja
sudo ninja install


echo "install ble.sh for autocomple and suggestion"
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local

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

echo "set default application"
xdg-mime default swayimg.desktop image/jpeg
xdg-mime default swayimg.desktop image/png
xdg-mime default swayimg.desktop image/gif
xdg-mime default swayimg.desktop image/webp
xdg-mime default swayimg.desktop image/svg+xml
xdg-mime default swayimg.desktop image/avif
xdg-mime default swayimg.desktop image/avifs
xdg-mime default vlc.desktop video/mpeg
xdg-mime default vlc.desktop video/ogg
xdg-mime default vlc.desktop video/webm
xdg-mime default vlc.desktop video/mp4
xdg-mime default vlc.desktop audio/mpeg        
xdg-mime default vlc.desktop audio/mp4         
xdg-mime default vlc.desktop audio/ogg
xdg-mime default thunar.desktop inode/directory
xdg-mime default zed.desktop text/javascript
xdg-mime default zed.desktop text/css
xdg-mime default zed.desktop text/x-python
xdg-mime default zed.desktop text/x-csrc
xdg-mime default zed.desktop text/x-lua
xdg-mime default zed.desktop application/x-shellscript
xdg-mime default zed.desktop application/json
xdg-mime default zed.desktop text/html
xdg-mime default zed.desktop application/xml
xdg-mime default zed.desktop text/markdown
xdg-mime default zed.desktop text/plain


update-desktop-database ~/.local/share/applications

echo "installing network manager applet -> using nm-applet"
sudo apt install network-manager-applet nm-connection-editor

echo "---------> install my applications"
sudo apt install xournalpp

echo "OK all things done now, reboot"
