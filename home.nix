{ config, pkgs, ... }:
let
    nixvim = import (builtins.fetchGit {
        url = "https://github.com/nix-community/nixvim";
    });
in
{
  imports = [
    ./modules/programs/alacritty.nix
    ./nixvim
    ./modules/programs/git.nix
    ./modules/programs/starship.nix
    nixvim.homeManagerModules.nixvim
  ];

  home.username = "nmf";
  home.homeDirectory = "/home/nmf";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  programs.nixvim.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      nmide = "cd ~/Documents/nmide";
      config = "cd ~/Documents/nix-config";
      rebuildOs = "sudo nixos-rebuild switch --flake ~/Documents/nix-config#laptop";
      rebuildHa = "home-manager switch -f ~/Documents/nix-config/hosts/laptop/home.nix";
    };
  };

  home.packages = with pkgs; [];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
