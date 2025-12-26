{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    ./cursors.nix
    ./firefox.nix
    ./foot.nix
    ./gtk.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./vscode.nix
  ];

  catppuccin = {
    enable = true;

    accent = "lavender";
    flavor = "mocha";
  };
}