#!/bin/bash

# Error check
function check_exit() {
    if [ $? -eq 0 ]; then
        echo "   Success   " 

    else 
        echo " ERROR: Fail, please see update.log"

        read -p "The last command exited with an error. Continue? (yes/no)"

        if [ "$answer" == "no" ]; then
            exit 1
        fi
    fi
}

# VScode snap or apt?
function vsgrab() {
    read -p "VSCode install type: snap or apt? (s/a)"

    if [ "$answer" == "s" ]; then
        read -p "Stable or Insiders? (s/i)"

        if [ "$answer" == "s" ]; then
            sudo snap install --classic codepage
        elif [ "$answer" == "i" ]; then
            sudo snap install --code-Insiders
        fi
    elif [ "$answer" == "a" ]; then
        read -p "Stable or Insiders? (s/i)"

        if [ "$answer" == "s" ]; then

            curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
            sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
            sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
            sudo apt-get install apt-transport-https
            sudo apt-get update
            sudo apt-get install code
        elif [ "$anwer" == "i" ]; then

            curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
            sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
            sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
            sudo apt-get install apt-transport-https
            sudo apt-get update
            sudo apt-get install code-insiders
        fi
    fi
    check_exit()
}

function sublimeify() {
    
}