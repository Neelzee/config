{ config, pkgs, ... }:
{
  imports = [
    ./modules/programs/alacritty.nix
    ./modules/programs/git.nix
    ./modules/programs/starship.nix
  ];

  home.username = "nmf";
  home.homeDirectory = "/home/nmf";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  programs.bash = {
    enable = true;
    shellAliases = {
      nmide = "cd ~/Documents/nmide && nix-shell";
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
