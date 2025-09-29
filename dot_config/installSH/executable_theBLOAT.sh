BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' 

echo -e "${BLUE}-------> install my applications${NC}"
sudo apt install blueman baobab pavucontrol zenity kdeconnect sway-notification-center fuzzel swaybg swayimg slurp wl-clipboard grim wtype swappy vlc rofi-dev imagemagick fzf zsh xournalpp

echo -e "${BLUE}-------> install code editor -> chosing zed editor${NC}"
curl -f https://zed.dev/install.sh | sh

echo -e "${BLUE}-------> build rofi-dev for quick calculation tool and powermenu${NC}"
git clone https://github.com/davatorium/rofi.git ~/Downloads/Systems/rofi
cd Downloads/Systems/rofi/
meson setup build -Dwayland=enabled -Dxcb=disabled
cd build/
sudo ninja build
cd
git clone https://github.com/svenstaro/rofi-calc.git ~/Downloads/Systems/rofi-calc
cd ~/Downloads/Systems/rofi-calc
meson setup build
cd build
ninja
sudo ninja install
cd

echo -e "${BLUE}-------> install firefox${NC}"
sudo install -d -m 0755 /etc/apt/keyrings 
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
sudo apt-get update && sudo apt-get install firefox 

echo "${BLUE}-------> install minimal cargo for favourite app like sworkstyle, zoxide fzf${NC}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --profile=minimal
cargo install sworkstyle
cargo install zoxide --locked

echo "${BLUE}------->install flatpak related apps like obsidian, mission center${NC}"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub io.missioncenter.MissionCenter
flatpak override --user --socket=system-bus org.missioncenter.MissionCenter
flatpak install flathub it.mijorus.gearlever

echo "${BLUE}------->install thunar file manager${NC}"
sudo apt install thunar thunar-archive-plugin thunar-volman gvfs lxappearance gsettings-desktop-schemas dconf-cli dconf-service
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'

echo "${BLUE}------->set default application${NC}"
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
echo -e "${GREEN}-------> DONE${NC}"
