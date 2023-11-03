#!/bin/bash

## Colors
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

EXECUTABLE_DIRECTORY=~/.local/bin
SOUND_DIRECTORY=~/.config/pomo

function install_with_sound() {
 echo "${green}[+]${white} Installing with sound notifications"
 if [ -e $SOUND_DIRECTORY/sound.wav ]
 then
   echo "${yellow}[-]${white}Sound already present"
 else
	 if [[ ! -d $SOUND_DIRECTORY ]]; then
		 mkdir -p $SOUND_DIRECTORY 
	 fi
   cp ./sound.wav $SOUND_DIRECTORY  
   echo "${green}[+]${white} Added sound"
 fi
 echo "${green}[+]${white} Adding pomo executable to your bin folder"
 cp ./pomo-sound.sh $EXECUTABLE_DIRECTORY/pomo
}

function install_without_sound() {
 echo "Installing without sound notifications"
 echo "${green}[+]${white} Adding pomo executable to your bin folder"
 cp ./pomo.sh $EXECUTABLE_DIRECTORY/pomo
}

while true; do
 read -rp "${cyan}[~]${white} Install with sound notifications? (y/n): " yn
 case $yn in
  [Yy]* )
   install_with_sound
   break;;
  [Nn]* )
   install_without_sound
   break;;
  * ) echo "Please answer 'yes' or 'no'.";;
  esac
done
