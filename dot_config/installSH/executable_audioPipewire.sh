BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${BLUE}-------> Install pipewire ralated things${NC}"
sudo apt install mpv mpv-mpris playerctl pipewire-audio  wireplumber pipewire-pulse pipewire-jack libspa-0.2-bluetooth 
echo -e "${GREEN}-------> DONE${NC}"

echo -e "${BLUE}-------> change pulseaudio service to pipewire service${NC}"
systemctl --user mask pulseaudio.service pulseaudio.socket
systemctl --user --now enable pipewire pipewire-pulse wireplumber.service
echo -e "${GREEN}-------> DONE${NC}"
