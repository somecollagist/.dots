#!/usr/bin/env bash

HERE=$(dirname $(realpath $0))
cd $HERE

usage() {
	cat << HELP_USAGE
usage: styler.sh <accent> <flavour>

Accents:
  rosewater
  flamingo
  pink
  mauve
  red
  maroon
  peach
  yellow
  green
  teal
  sky
  sapphire
  blue
  lavender

Flavours:
  latte
  frappe
  macchiato
  mocha
HELP_USAGE
	exit 0
}

accents="rosewater flamingo pink mauve red maroon peach yellow green teal sky sapphire blue lavender"
flavours="latte frappe macchiato mocha"

if [ $# -ne 2 ]; then
  usage
fi

if [ -z $(echo $accents | grep -o $1) ]; then
  usage
fi

if [ -z $(echo $flavours | grep -o $2) ]; then
  usage
fi

for f in `find . -name "*.nix"`; do
  if [ $f != "./cursors.nix" ]; then
    sed -E -i 's/flavor \= \"[a-z]+\";/flavor \= \"'$2'\";/' $f
    sed -E -i 's/accent \= \"[a-z]+\";/accent \= \"'$1'\";/' $f
  fi
done