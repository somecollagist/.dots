{ config, lib, pkgs, modulesPath, ... }:

{
  services = {
    playerctld.enable = true;
  };
}