#!/bin/sh
cd "${0%/*}"
#echo $(pwd)
echo "Checking if zsh is installed."
if ! [ -x "$(command -v zsh)" ] 
then
    echo "zsh does't appear to be installed."
    echo "Attempting to install via apt."
    sudo apt install zsh
else
    echo "zsh appears to be already installed. Skipping..."
fi

echo ""
sleep 1
echo "Checking if Oh My ZSH is installed"
echo "Checking in $HOME for the .oh-my-zsh folder."

if [ ! -d "$HOME/.oh-my-zsh" ]
then
    echo ".oh-my-zsh folder doesn't exist. Running install script."
    sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
else
    echo ".oh-my-zsh folder exists. Assuming its installed already."
fi

echo ""
sleep 1


while true; do

read -p "Do you want to set zsh as your default shell? (y/n) " yn

case $yn in
        [yY] ) echo "";
               sudo chsh -s /bin/zsh $USER;
               echo "You may have to reboot for this change to take effect."
               sleep 1
               break;;
        [nN] ) echo "";
               break;;
        * ) echo "";;
esac

done

echo ""
sleep 1


echo "Symlinking repo file .zshrc to $HOME/.zshrc"
unlink $HOME/.zshrc
ln -s $(pwd)/.zshrc $HOME/.zshrc

echo ""
sleep 1

echo "Symlinking repo zsh theme file ubunly.zsh-theme to $HOME/.oh-my-zsh/custom/themes/ubunly.zsh-theme"
unlink $HOME/.oh-my-zsh/custom/themes/ubunly.zsh-theme
ln -s $(pwd)/ubunly.zsh-theme $HOME/.oh-my-zsh/custom/themes/ubunly.zsh-theme


echo ""
sleep 1

while true; do

read -p "Do you want to install nala? (y/n) " yn

case $yn in
	[yY] ) echo "Installing nala via apt.";
               sudo apt install nala;
	       break;;
	[nN] ) echo "Exiting..."; break;;
	* ) echo "";;
esac

done





while true; do

read -p "Do you want to restart the machine for changes to take effect? (y/n) " yn

case $yn in
        [yY] ) sudo reboot; break;;
        [nN] ) echo "Exiting..."; break;;
        * ) echo "";;
esac

done

