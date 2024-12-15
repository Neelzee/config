{ pkgs, ... }:
{
  imports = 
    [ 
      ./languages 
      ./treesitter 
      ./telescope.nix
      ./editor
    ];
}
