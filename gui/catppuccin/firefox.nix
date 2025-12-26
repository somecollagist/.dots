{ config, lib, pkgs, modulesPath, ... }:

{
  catppuccin.firefox = {
    enable = true;
    force = true;

    accent = "lavender";
    flavor = "mocha";
  };
}