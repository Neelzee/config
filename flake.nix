{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { nixpkgs, home-manager, nixvim, ... }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
	  home-manager.nixosModules.home-manager {
          home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              sharedModules = [
                nixvim.homeManagerModules.nixvim
              ];
              users.nmf = import ./home.nix;
            };
          }
        ];
        specialArgs = inputs;
      };
    };
}

