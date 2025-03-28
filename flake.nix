{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Terminal
    ghostty = {
      url = "github:ghostty-org/ghostty";
    };
  };

  outputs =
    specialArgs@{
      nixpkgs,
      home-manager,
      ghostty,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.nmf = import ./home.nix;
            };
          }
          {
            environment.systemPackages = [
              ghostty.packages.${system}.default
            ];
          }
        ];
        inherit specialArgs;
      };
    };
}
