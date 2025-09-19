echo "install zig for ly"
wget -P ~/Downloads/Systems/ https://ziglang.org/download/0.15.1/zig-x86_64-linux-0.15.1.tar.xz
tar -xf Downloads/Systems/zig-x86_64-linux-0.15.1.tar.xz -C ~/Downloads/Systems/
mv zig-x86_64-linux-0.15.1/ zig
rm ~/Downloads/Systems/zig-x86_64-linux-0.15.1.tar.xz
source ~/.bashrc
echo "Zig version: $(zig -v)"
sudo ln -s ~/Downloads/Systems/zig/zig /usr/local/bin/zig

echo "begin download ly and build the project"
git clone https://codeberg.org/fairyglade/ly.git ~/Downloads/Systems/ly
cd ~/Downloads/Systems/ly
zig build
sudo zig build installexe -Dinit_system=systemd
sudo systemctl disable getty@tty2.service
sudo systemctl enable ly.service
