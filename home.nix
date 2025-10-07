{ lib, pkgs, ... }:

{
    home = {
        packages = with pkgs; [
            hello
        ];

        username = "somecollagist";
        homeDirectory = "/home/somecollagist";

        stateVersion = "25.05";
    };
}