{ config, pkgs, ... }:

{
  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    git
    alacritty
    spotify
  ];
}

