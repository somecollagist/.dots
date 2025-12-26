{ inputs, pkgs, ... }:

{
  imports = [
    inputs.ags.homeManagerModules.default
    ./apps/apps.nix
    ./gui/gui.nix
    ./services.nix
  ];

  home = {
    packages = with pkgs; [
      catppuccin
      catppuccin-discord
      catppuccin-gtk

      hyprlock
      hypridle
      hyprpaper
      hyprsunset
      hyprpicker
      hyprpolkitagent

      playerctl
      sway-contrib.grimshot
      wf-recorder

      bc
      docker
      git
      jq
      socat

      cava
      discord
      foot
      krita
      lunar-client
      spotify
      vscode
    ];

    username = "somecollagist";
    homeDirectory = "/home/somecollagist";

    stateVersion = "25.05";
  };
}