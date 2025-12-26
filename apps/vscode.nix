{ lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          rust-lang.rust-analyzer
          bbenoist.nix
          ms-vscode.cpptools
          ms-python.python
          haskell.haskell
          justusadam.language-haskell
          # vue.volar
          eamodio.gitlens
          james-yu.latex-workshop
          ms-vscode.hexeditor
          ms-vscode-remote.remote-ssh
          ms-vscode-remote.remote-ssh-edit
          ms-vscode.remote-explorer
          catppuccin.catppuccin-vsc
          catppuccin.catppuccin-vsc-icons
        ];
        userSettings = {
          "editor.bracketPairColorization.enabled" = false;
          "editor.codeLens" = false;
          "editor.fontFamily" = "'Droid Sans Mono', 'monospace', monospace, 'DroidSansM Nerd Font'";
          "editor.inlayHints.enabled" = false;
          "editor.tabSize" = 2;
          "explorer.compactFolders" = false;
          "files.simpleDialog.enable" = true;
          "rust-analyzer.server.path" = "rust-analyzer";
          "workbench.colorTheme" = "Catppuccin Mocha";
          "workbench.iconTheme" = "catppuccin-mocha";
        };
      };
    };
  };
}