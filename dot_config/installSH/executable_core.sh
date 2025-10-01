BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' 

set -e
echo -e "${BLUE}-------> Install core for my sway config ${NC}"
sudo apt install light sway xwayland gtklock waybar curl wget gpg flatpak meson ninja-build wayland-protocols unzip jq xdg-utils
echo -e "${GREEN}-------> DONE${NC}"

