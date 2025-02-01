{ ... }:
{
  imports = [
    ./modules/programs/alacritty.nix
    ./modules/programs/git.nix
    ./modules/programs/starship.nix
    ./modules/tmux.nix
    ./modules/languages.nix
  ];

  home = {
    username = "nmf";
    homeDirectory = "/home/nmf";
    stateVersion = "24.11"; # Please read the comment before changing.
    packages = [ ];
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs = {
    bash = {
      enable = true;
      shellAliases = {
        nmide = "cd ~/Documents/nmide";
        config = "cd ~/Documents/nix-config";
        rebuildOs = "sudo nixos-rebuild switch --flake ~/Documents/nix-config#laptop";
        rebuildHa = "home-manager switch -f ~/Documents/nix-config/hosts/laptop/home.nix";
      };
    };

    bat = {
      enable = true;
    };
  };
}
