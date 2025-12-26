{ config, lib, pkgs, modulesPath, ... }:

{
  programs.firefox = {
    enable = true;

    policies = {
      ExtensionSettings = {
        "*".installation_mode = "allowed";
        "FirefoxColor@mozilla.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/firefox-color/latest.xpi";
          installation_mode = "force_installed";    
        };
      };
    };
  };
}