{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Neelzee";
    userEmail = "nilsien2001@gmail.com";
    aliases = {
      co = "checkout";
      st = "status";
    };
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  programs.git.delta.enable = true;
}

