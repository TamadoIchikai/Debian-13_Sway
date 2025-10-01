BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' 

set -e
echo -e "${BLUE}-------> install nerd, awesome font alongside with papirus icon ${NC}"
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
echo -e "${GREEN}-------> DONE${NC}"

