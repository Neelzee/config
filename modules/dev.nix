{ config, pkgs, ... }:

{
  imports = [
    ./programs/alacritty.nix
    ./programs/git.nix
    ./programs/lazyvim.nix
  ];
}

