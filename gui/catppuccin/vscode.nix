{ config, lib, pkgs, modulesPath, ... }:

{
  catppuccin.vscode.profiles.default = {
    enable = true;

    accent = "lavender";
    flavor = "mocha";

    icons = {
      enable = true;
      
      flavor = "mocha";
    };

    settings = {
      accent = "lavender";
    };
  };
}