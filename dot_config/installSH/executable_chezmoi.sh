BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' 

echo -e "${BLUE}-------> install chezmoi for config file setup${NC}"
sudo sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin
chezmoi init https://github.com/TamadoIchikai/Debian-13_Sway
chezmoi init --apply https://github.com/TamadoIchikai/Debian-13_Sway
echo -e "${GREEN}-------> DONE${NC}"

