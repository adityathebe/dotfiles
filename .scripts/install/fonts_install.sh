#!/bin/bash

zip_folder=YosemiteFont
fonts_folder=$HOME/.local/share/fonts

printf "Downloading Fonts"
wget -O "${zip_folder}.zip" "https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip" -qq --show-progress &&

printf "Installing"
unzip -qq "${zip_folder}.zip" -d "${zip_folder}" &&
mv ${zip_folder}/YosemiteSanFranciscoFont-master/*.ttf $fonts_folder

printf "\nCleaning unnecessary files"
rm -rf "${zip_folder}.zip" "${zip_folder}"

printf "\nInstalling Roboto Font for Powerline\n"
wget -P $fonts_folder "https://github.com/powerline/fonts/blob/master/RobotoMono/Roboto%20Mono%20Thin%20for%20Powerline.ttf" -qq --show-progress
