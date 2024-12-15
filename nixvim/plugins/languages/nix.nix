{ pkgs, ... }:
let
  flake = "/home/nmf/Documents/nix-config";
in
{
  programs.nixvim.plugins = {
    nix.enable = true;
    hmts.enable = true;
    nix-develop.enable = true;

    conform-nvim.settings = {
      formatters_by_ft = {
        nix = [ "nixfmt-rfc-style" ];
      };

      formatters = {
        nixfmt-rfc-style = {
          command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
        };
      };
    };

    lint = {
      lintersByFt = {
        nix = [ "statix" ];
      };

      linters = {
        statix = {
          cmd = "${pkgs.statix}/bin/statix";
        };
      };
    };

    lsp.servers.nixd = {
      enable = true;
      settings = {
        nixpkgs.expr = ''import (builtins.getFlake "${flake}").inputs.nixpkgs { }'';
        options = {
          nixos.expr = ''(builtins.getFlake "${flake}").nixosConfigurations.alfhiem.options'';
          home_manager.expr = ''(builtins.getFlake "${flake}").nixosConfigurations.alfhiem.options'';
        };
        flake_parts.expr = ''let flake = builtins.getFlake ("${flake}"); in flake.debug.options // flake.currentSystem.options'';
      };
    };
  };

  programs.nixvim.extraConfigVim = ''
    au BufRead,BufNewFile flake.lock setf json
  '';
}
