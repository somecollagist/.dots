{ config, lib, pkgs, modulesPath, ... }:

{
  programs.ags = {
    enable = true;

    extraPackages = with pkgs; [
      ags
      astal.battery
      astal.bluetooth
      astal.cava
      astal.gjs
      astal.hyprland
      astal.io
      astal.mpris
      astal.network
      astal.notifd
      astal.wireplumber
    ];
  };
}