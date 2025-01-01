#!/bin/bash

REPO=$(dirname $(dirname $(realpath $0)))
SETUP=$REPO/setup
PKGLISTS=$SETUP/*.pkglist

for PKGLIST in $PKGLISTS $SETUP/services; do
    sort $PKGLIST -o $PKGLIST
done