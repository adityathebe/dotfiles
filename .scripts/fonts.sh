#!/bin/bash

zipfolder=YosemiteFont

printf "Downloading Fonts"
wget -O "${zipfolder}.zip" "https://github.com/supermarin/YosemiteSanFranciscoFont/archive/master.zip" -qq --show-progress &&

printf "Installing"
unzip -qq "${zipfolder}.zip" -d "${zipfolder}" &&
mv ${zipfolder}/YosemiteSanFranciscoFont-master/*.ttf ~/.fonts &&

printf "\nCleaning unnecessary files"
rm -rf "${zipfolder}.zip" "${zipfolder}"
