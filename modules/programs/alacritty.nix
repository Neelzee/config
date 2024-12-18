{ config, pkgs, ... }:

{
  # Enable Alacritty
  programs.alacritty.enable = true;

  # Configure Alacritty settings
  programs.alacritty.settings = {
    font = {
      normal = {
          family = "FiraCode Nerd Font";
        };
      size = 14.0;
    };
  };
}

