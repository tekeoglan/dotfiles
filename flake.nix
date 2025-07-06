{
  description = "Home Manager configuration of tekeoglan";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:Nixos/nixpkgs/nixos-25.05";
    nixpkgs-us.url = "github:Nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    illogical-impulse = {
      url = "path:./illogical-impulse";
    };
  };
  outputs =
    { nixpkgs, nixpkgs-us, home-manager, illogical-impulse, ... }:
    let
      system = builtins.currentSystem;
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-us = nixpkgs-us.legacyPackages.${system};
    in
    {
      homeConfigurations."tekeoglan" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit pkgs-us illogical-impulse;
        };

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
        ./home.nix
        ./modules
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
