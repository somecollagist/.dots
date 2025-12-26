{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    ./ags/ags.nix
    ./catppuccin/catppuccin.nix
    ./hypr/hyprland.nix
    ./theme.nix
  ];
}