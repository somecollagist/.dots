#!/bin/bash

## code --list-extensions > vscode.pkglist

for PKG in $(cat $APPS/vscode.pkglist | xargs); do
    sudo -u $LOGNAME code --install-extension $PKG
done