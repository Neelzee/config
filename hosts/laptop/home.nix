{ config, pkgs, inputs, ... }:

{

  imports = [
    ../../modules/common.nix
    ../../modules/dev.nix
  ];

  home.username = "nmf";
  home.homeDirectory = "/home/nmf";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  programs.bash = {
      enable = true;
      shellAliases = {
        nmide = "cd ~/Documents/nmide";
        config = "cd ~/Documents/config";
        rebuildOs = "sudo nixos-rebuild switch --flake ~/Documents/nix-config#laptop";
        rebuildHa = "home-manager switch -f ~/Documents/nix-config/hosts/laptop/home.nix";
      };
  };

  home.packages = [];

  home.file = {};

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
