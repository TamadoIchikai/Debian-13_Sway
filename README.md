# Description
- This is my github repo for debian 13 + Sway setup, this including config files, scripts and install.sh file for newly created machine
# Install
- When firsly boot into debian 
```bash
su -
apt install sudo neovim git tmux
usermod -aG sudo "<ADD YOUR USER NAME HERE>"
exit
```
- Then run install.sh file
```bash
sudo chmod +x install.sh
sudo ./install.sh
```
- Then open obsidian and continue
