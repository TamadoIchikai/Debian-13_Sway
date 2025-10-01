BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' 


run_step() {
    desc=$1
    shift
    echo -e "${BLUE}------------> $desc ${NC}"
    "$@" || { echo -e "${GREEN}✖ Failed at step: $desc${NC}"; exit 1; }
}

run_step "core package" sudo ~/.config/installSH/core.sh
run_step "libraries and dependencies" sudo ~/.config/installSH/utils.sh
run_step "Fonts" sudo ~/.config/installSH/fonts.sh
run_step "Audio" sudo ~/.config/installSH/audioPipewire.sh
run_step "keyboard layout" sudo ~/.config/installSH/fcitxKeyboard.sh
run_step "Applications" sudo ~/.config/installSH/theBLOAT.sh
run_step "Autotiling for sway" sudo ~/.config/installSH/autotiling-rs.sh
run_step "Firefox Custom" sudo ~/.config/installSH/applyFirefoxCustom.sh
run_step "Thorium" sudo ~/.config/installSH/thorium_install.sh
run_step "Obsidian" sudo ~/.config/installSH/obsidianAppimage.sh
run_step "Network manager" sudo ~/.config/installSH/networkManager.sh


echo -e "${GREEN}------->DONE please manually start LY installation and check if network scan working correctly, if not please read README.md${NC}"

cd ~/.config/installSH/

