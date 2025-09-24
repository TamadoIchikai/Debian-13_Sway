BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' 

echo -e "${BLUE}-------> install fcitx for vietnamese and japanese keyboard ${NC}"
sudo apt install fcitx5 fcitx5-configtool fcitx5-frontend-gtk3 fcitx5-frontend-gtk4 fcitx5-frontend-qt6 fcitx5-unikey fcitx5-mozc
echo -e "${GREEN}-------> DONE${NC}"

