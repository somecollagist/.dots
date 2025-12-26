{ config, lib, pkgs, modulesPath, ... }:

{
  catppuccin.gtk.icon = {
    enable = true;

    accent = "lavender";
    flavor = "mocha";
  };
}