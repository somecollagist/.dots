{
  description = "Home Manager Configuration";

  inputs = {
    home-manager = {
      url = "github:/nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "nixpkgs/nixos-unstable";

    ags.url             = "github:aylur/ags";
    astal.url           = "github:aylur/astal";
    catppuccin.url      = "github:catppuccin/nix";
  };

  outputs = {
    home-manager,
    nixpkgs,
    ags,
    astal,
    catppuccin,
    ...
  }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfreePredicate = (_: true);
      };
  in {
    homeConfigurations = {
      profile = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home.nix
          catppuccin.homeModules.catppuccin
        ];
      };
    };
  };
}