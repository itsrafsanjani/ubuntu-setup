#!/bin/bash

echo "Welcome! Let's start setting up your system xD It could take more than 10 minutes, be patient"

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install build-essential -y

echo 'installing wget'
sudo apt install gdebi-core wget

echo 'installing curl' 
sudo apt install curl -y

echo 'installing vim'
sudo apt install vim -y
clear

echo 'installing git' 
sudo apt install git -y

echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"Olavio Lacerda\""
read git_config_user_name
git config --global user.name "$git_config_user_name"
clear 

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"olavio.lacerda@hotmail.com\""
read git_config_user_email
git config --global user.email $git_config_user_email
clear

echo "Can I set VIM as your default GIT editor for you? (y/n)"
read git_core_editor_to_vim
if echo "$git_core_editor_to_vim" | grep -iq "^y" ;then
	git config --global core.editor vim
else
	echo "Okay, no problem. :) Let's move on!"
fi

echo "Generating a SSH Key"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo 'enabling workspaces for both screens' 
gsettings set org.gnome.mutter workspaces-only-on-primary false

echo 'installing tool to handle clipboard via CLI'
sudo apt-get install xclip -y

export alias pbcopy='xclip -selection clipboard'
export alias pbpaste='xclip -selection clipboard -o'
source ~/.zshrc

echo 'installing code'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y # or code-insiders

source ~/.zshrc
nvm --version
nvm install 16
nvm alias default 16
node --version
npm --version

echo 'installing Typescript'
npm install -g typescript

echo 'installing autosuggestions' 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
source ~/.zshrc

echo 'installing fira code font'
sudo apt install fonts-firacode -y

echo 'installing dbeaver'
wget -c https://dbeaver.io/files/6.0.0/dbeaver-ce_6.0.0_amd64.deb
sudo dpkg -i dbeaver-ce_6.0.0_amd64.deb
sudo apt-get install -f

echo 'installing Postman' 
snap install postman

echo 'installing vlc'
sudo apt install vlc -y
sudo apt install vlc-plugin-access-extra libbluray-bdj libdvdcss2 -y

echo 'installing heroku-cli'
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
heroku --version

echo 'installing apache2'
sudo apt install apache2 -y

echo 'installing php and libapache2-mod-php'
sudo apt install php libapache2-mod-php -y

echo 'installing mysql-server'
sudo apt install mysql-server -y

echo 'installing composer'
sudo apt update && sudo apt install wget php-cli php-zip unzip curl -y
curl -sS https://getcomposer.org/installer |php
sudo mv composer.phar /usr/local/bin/composer

echo 'installing php-mysql'
sudo apt install php-mysql -y



echo 'All tools successfully installed. You are ready to shine :).'
