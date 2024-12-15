{ config, pkgs, inputs, ... }:
{
  programs.nixvim = {
    clipboard.register = "unnamedplus";
  };
}
