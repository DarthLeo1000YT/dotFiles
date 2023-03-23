#!/bin/sh
cd "${0%/*}"
#echo $(pwd)
sudo apt update
setlink(){
    unlink "$HOME/$1"
    ln -s "$(pwd)/$2" "$HOME/$1"
}

green="\e[32m"
yellow="\e[33m"
red="\e[31m"
reset="\e[0m"

CHOICES=$(whiptail --separate-output --checklist "Choose options" 15 75 5 \
  "1" "Install ZSH" ON \
  "2" "Install Oh My ZSH" ON \
  "3" "Install custom .zshrc, alias, and custom theme" ON \
  "4" "Install Nala apt shell" ON \
  "5" "Reboot after finished" OFF 3>&1 1>&2 2>&3)

if [ -z "$CHOICES" ]; then
  echo "${red}No option was selected (user hit Cancel or unselected all options)${reset}"
else
  for CHOICE in $CHOICES; do
    case "$CHOICE" in
    "1")
        echo ""
        echo "${green}Checking if zsh is installed.${reset}"
        if ! [ -x "$(command -v zsh)" ] 
        then
            echo "${green}zsh does't appear to be installed.${reset}"
            echo "${green}Attempting to install via apt.${reset}"
            sudo apt install -y zsh 
        else
            echo "${yellow}zsh appears to be already installed. Skipping...${reset}"
        fi
      ;;
    "2")
        echo ""
        echo "${green}Checking if Oh My ZSH is installed.${reset}"
        echo "${green}Checking in $HOME for the .oh-my-zsh folder.${reset}"

        if [ ! -d "$HOME/.oh-my-zsh" ]
        then
            echo "${green}.oh-my-zsh folder doesn't exist. Running install script.${reset}"
            RUNZSH="no" sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
        else
            echo "${yellow}.oh-my-zsh folder exists. Assuming its installed already.${reset}"
        fi
        ;;
    "3")
        echo ""
        echo "${green}Symlinking repo file .zshrc to $HOME/.zshrc${reset}"
        setlink .zshrc .zshrc
        echo "${green}Symlinking repo zsh theme file ubunly.zsh-theme to $HOME/.oh-my-zsh/custom/themes/ubunly.zsh-theme${reset}"
        setlink .oh-my-zsh/custom/themes/ubunly.zsh-theme ubunly.zsh-theme
        ;;
    "4")
        echo ""
        echo "${green}Checking if nala is installed.${reset}"
        if ! [ -x "$(command -v nala)" ] 
        then
            echo ""
            echo "${green}nala does't appear to be installed.${reset}"
            echo "${green}Attempting to install via apt.${reset}"
            sudo apt install -y nala
        else
            echo "${yellow}nala appears to be already installed. Skipping...${reset}"
        fi
        ;;
    "5")
        sudo reboot
        ;;
    *)
        echo "Unsupported item $CHOICE!" >&2
        exit 1
        ;;
    esac
  done
fi
