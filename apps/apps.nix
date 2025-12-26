{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    ./direnv.nix
    ./firefox.nix
    ./foot.nix
    ./vscode.nix
  ];

  programs.bash.enable = true;
}