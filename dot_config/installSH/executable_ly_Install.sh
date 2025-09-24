BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' 

echo -e "${BLUE}-------> install zig for ly ${NC}"
wget -P ~/Downloads/Systems/ https://ziglang.org/download/0.15.1/zig-x86_64-linux-0.15.1.tar.xz
tar -xf Downloads/Systems/zig-x86_64-linux-0.15.1.tar.xz -C ~/Downloads/Systems/
mv zig-x86_64-linux-0.15.1/ zig
rm ~/Downloads/Systems/zig-x86_64-linux-0.15.1.tar.xz
source ~/.bashrc
echo "Zig version: $(zig -v)"
sudo ln -s ~/Downloads/Systems/zig/zig /usr/local/bin/zig
echo -e "${GREEN}-------> DONE${NC}"

echo -e "${BLUE}-------> begin download ly and build the project ${NC}"
git clone https://codeberg.org/fairyglade/ly.git ~/Downloads/Systems/ly
cd ~/Downloads/Systems/ly
zig build
sudo zig build installexe -Dinit_system=systemd
sudo systemctl disable getty@tty2.service
sudo systemctl enable ly.service

echo -e "${GREEN}-------> DONE${NC}"
