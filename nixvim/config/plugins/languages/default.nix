{ pkgs, ... }:
{
  imports =
    [ 
      ./json.nix 
      ./nix.nix
      ./rust.nix
      ./typescript.ts
    ];
}
