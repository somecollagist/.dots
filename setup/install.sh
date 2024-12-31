#!/bin/bash

clear
assert() {
    if [ $? -ne 0 ]; then
        echo $2
        exit 1
    else
        echo $1
    fi 
}

# Verify root access
if [ $(id -u) -ne 0 ]; then
    echo "This script requires root access in order to be run"
    exit 1
fi

# Get variables
export REPO=$(dirname $(dirname $(realpath $0)))
export ASSETS=$REPO/assets
export DOTS=$REPO/config
export SETUP=$REPO/setup
export APPS=$SETUP/apps
export LOGNAME=$(logname)
export CONFIG=/home/$LOGNAME/.config
export CONFASSETS=/home/$LOGNAME/.assets

# Keep the pwd the same
cd $REPO

# Relink config
rm -rf $CONFIG
ln -s $DOTS $CONFIG
ln -s $ASSETS $CONFASSETS
assert \
    "Created configuration symlinks" \
    "Failed to create configuration symlinks"

# Install pacman packages
echo "Installing packages via pacman..."
pacman -Syy
assert \
    "Synchronised pacman repositories" \
    "Failed to synchronise pacman repositories"
pacman -S $(cat $SETUP/pacman.pkglist | xargs) --needed --noconfirm
assert \
    "Successfully installed all required packages via pacman" \
    "Failed to install all required packages via pacman"

# Install yay (if not installed)
if [ ! -d "/opt/yay-git" ]; then
    # yay is not installed
    cd /opt
    git clone https://aur.archlinux.org/yay-git.git
    assert \
        "Cloned yay git repository to /opt" \
        "Failed to clone yay"
    cd yay-git
    makepkg -si --needed --noconfirm
    assert \
        "Successfully installed yay" \
        "Failed to install yay"
else
    echo "yay is already installed, skipping..."
fi

# Ensure that the pwd is reset
cd $REPO

# Install yay packages
sudo -u $LOGNAME yay -S $(cat $SETUP/aur.pkglist | xargs) --needed --noconfirm
assert \
    "Successfully installed all required packages via AUR" \
    "Failed to install all required packages via AUR"

# Enable services
systemctl enable --now $(cat $SETUP/services)

# Run app hooks
for HOOK in $APPS/*.sh; do
    echo ">>> $HOOK"
    $HOOK
    assert \
        "Successfully completed hook $HOOK" \
        "Failed to complete hook $HOOK"
    echo "<<< $HOOK"
    cd $REPO
done