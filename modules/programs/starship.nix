{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.starship
  ];
  
  programs.starship.enable = true;

  programs.bash.enable = true;
}

