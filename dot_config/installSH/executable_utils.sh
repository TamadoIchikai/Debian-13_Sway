BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${BLUE}-------> creating basic directories${NC}"
mkdir -p ~/Downloads/Systems ~/.local/bin

echo -e "${BLUE}-------> install basic utils and libs${NC}"
sudo apt install scdoc fuse libqalculate-dev qalc libfuse2t64 gawk ufw cliphist flex bison brightnessctl cmake llvm build-essential xauth xserver-xorg xdg-desktop-portal xdg-desktop-portal-wlr 

sudo apt install libcairo2-dev libpango1.0-dev libglib2.0-dev libgdk-pixbuf-xlib-2.0-dev libxkbcommon-dev libwayland-dev libpam0g-dev libxcb-xkb-dev libglib2.0-bin libnotify-bin
echo -e "${GREEN}-------> DONE${NC}"



