{ config, pkgs, inputs, ... }:
{
  imports = 
    [
      ./settings.nix  
      ./keymaps.nix
      ./plugins
    ];
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
  };
}
