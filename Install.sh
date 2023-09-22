#!/bin/bash

mkdir -p ~/MakeGen
cp -p makegen.sh ~/MakeGen/makegen.sh
chmod +x ~/MakeGen/makegen.sh
echo "alias makegen="~/MakeGen/makegen.sh"" >> ~/.zshrc
echo "alias makegen="~/MakeGen/makegen.sh"" >> ~/.bashrc 
echo "Installation has finished, Please restart your terminal"

