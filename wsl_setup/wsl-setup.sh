#!/bin/sh 
LOG_FILE=script.log
exec > >(while read -r line; do printf '%s %s\n' "$(date --rfc-3339=seconds)" "$line" | tee -a $LOG_FILE; done)
exec 2> >(while read -r line; do printf '%s %s\n' "$(date --rfc-3339=seconds)" "$line" | tee -a $LOG_FILE; done >&2)

## Update and upgrade the OS
echo "-----------------------------------Updating apt-"
sudo apt-get update -y

echo "-----------------------------------Upgrading apt-"
sudo apt-get upgrade -y

## Install python3
echo "-----------------------------------Installing python3-"
sudo apt-get install python3 -y

echo "-----------------------------------Installing pip3-"
sudo apt-get install python3-pip

## Add custom bashrc aliases and scripts

cd ~
echo "------------------------------------Backing up bashrc"
cp .bashrc backbashrc.txt
echo "-----------------------------------Updating bashrc with aliases-"
echo "#-------------------Custom aliases" >> .bashrc

echo "#set Python3 as the default python
alias python='python3'" >> .bashrc

echo "#update and upgrade
alias update='sudo apt update && sudo apt upgrade'
alias autoremove='sudo apt autoremove'

#open explorer in current directory
alias f='explorer.exe .'

#navigate to the windows user
alias wh='cd /mnt/c/Users/Roshan/'

#navigate to the linux user
alias h='cd ~'" >> .bashrc

# Powerline shell installation


echo "--------------------------------------------------------------------"
echo "-----------------------------------Starting powerline install process-"
echo "---------------------------------------------------------------------"
echo "-----------------------------------Installing powerline fonts on linux-"
echo "----------------------------------------------------------------------"

sudo apt-get install fonts-powerline -y

echo "-------(you might need to do some additional config on the windows side, check docs)-"

echo "-----------------------------------Installing powerline shell on linux-"
sudo pip3 install powerline-shell -y

cd ~

echo "-----------------------------------Creating powerline-config file in home/.config/powerline-shell/-"
mkdir -p ~/.config/powerline-shell && powerline-shell --generate-config > ~/.config/powerline-shell/config.json

echo "-----------------------------------Updating bashrc-"

echo "
# Powerline config
function _update_ps1(){
    PS1=\$(powerline-shell \$?)
}

PROMPT_COMMAND=\"_update_ps1;\$PROMPT_COMMAND\" 
" >> .bashrc

echo "-----------------------------------Updating config with custom preferences-"

echo '{
          "segments": [
                "newline",
                "virtual_env",
                "username",
                "hostname",
                "ssh",
                "cwd",
                "newline",
                "git",
                "hg",
                "jobs",
                "root"
            ]
        }' > ~/.config/powerline-shell/config.json

echo " ---- Setup script execution complete, please restart shell---"

# [To-do] install java, nvm and npm
