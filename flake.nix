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
    nixgl.url = "github:nix-community/nixGL";

    anyrun.url = "github:Kirottu/anyrun";
    anyrun.inputs.nixpkgs.follows = "nixpkgs-us";

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs-us";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs-us";
    };
  };
  outputs =
    { nixpkgs, nixpkgs-us, home-manager, ... }@ inputs:
    let
      system = builtins.currentSystem;
      pkgs = import nixpkgs { system = system; config.allowUnfree = true; };
      pkgs-us = import nixpkgs-us { system = system; config.allowUnfree = true; };
    in
    {
      homeConfigurations."tekeoglan" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit pkgs-us inputs;
        };

        modules = [
        ./home.nix
        ./modules
        ./illogical-impulse
        ];
      };
    };
}
