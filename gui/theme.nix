{ config, lib, pkgs, modulesPath, ... }:

let
  catppuccin_name = "catppuccin-mocha-sapphire-standard+normal";
  catppuccin = pkgs.catppuccin-gtk.override {
    accents = [ "sapphire" ];
    size = "standard";
    tweaks = [ "normal" ];
    variant = "mocha";
  };
in
{
  gtk = {
    enable = true;
    theme = {
      name = catppuccin_name;
      package = catppuccin;
    };
  };

  services.swww.enable = true;
}