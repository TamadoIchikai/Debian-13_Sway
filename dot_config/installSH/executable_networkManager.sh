BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' 

echo -e "${BLUE}------->installing network manager applet -> using nm-applet${NC}"
sudo apt install network-manager-applet nm-connection-editor

echo -e "${RED}------->WARNING: if current machine is built without pre-config for network-manager-applet (nm-applet) then you must look up on guilde how to disable default network manager (like debian 'standard utils' will only connect to wifi at installation process, nm-applet CAN NOT overide system default${NC}"
echo -e "${GREEN}-------> DONE${NC}"
