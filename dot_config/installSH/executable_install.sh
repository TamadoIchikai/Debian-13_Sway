BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' 

echo -e "${BLUE}--------------------> Initializing installation process ${NC}"
echo -e "${BLUE}------------> core package ${NC}"
sudo .~/.config/installSH/core.sh
echo -e "${BLUE}------------> libraries and dependencies ${NC}"
sudo .~/.config/installSH/utils.sh
echo -e "${BLUE}------------> libraries and dependencies ${NC}"
sudo .~/.config/installSH/fonts.sh
echo -e "${BLUE}------------> libraries and dependencies ${NC}"
sudo .~/.config/installSH/audioPipewire.sh
echo -e "${BLUE}------------> libraries and dependencies ${NC}"
sudo .~/.config/installSH/fcitxKeyboard.sh
echo -e "${BLUE}------------> libraries and dependencies ${NC}"
sudo .~/.config/installSH/theBLOAT.sh
echo -e "${BLUE}------------> libraries and dependencies ${NC}"
sudo .~/.config/installSH/networkManager.sh

echo -e "${GREEN}------->DONE please manually start LY installation and check if network scan working correctly, if not please read README.md${NC}"

cd ~/.config/installSH/

