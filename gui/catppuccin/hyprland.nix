{ config, lib, pkgs, modulesPath, ... }:

{
  catppuccin.hyprland = {
    enable = true;

    accent = "lavender";
    flavor = "mocha";
  };
}