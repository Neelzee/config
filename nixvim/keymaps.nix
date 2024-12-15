{ config, pkgs, inputs, ... }:
{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [

    ];
  };
}
