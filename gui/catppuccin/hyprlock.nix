{ config, lib, pkgs, modulesPath, ... }:

{
  catppuccin.hyprlock = {
    enable = true;

    accent = "lavender";
    flavor = "mocha";
  };
}