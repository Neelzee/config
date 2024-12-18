{ config, pkgs, inputs, ... }:
{
  imports = 
    [
      ./settings.nix  
      ./keymaps.nix
      ./plugins
    ];
  colorschemes.catppuccin.enable = true;
  plugins.lualine.enable = true;
}
