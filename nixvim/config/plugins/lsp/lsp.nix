{
  plugins = {
    lsp-signature.enable = true;

    lsp = {
      enable = true;
      keymaps.lspBuf = {
        "<c-k>" = "signature_help";
        "gi" = "implementation";
      };
      servers = {
        typos_lsp.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
          installRustfmt = true;
        };
        purescriptls = {
          enable = true;
          package = null;
        };
        hls = {
          enable = true;
          installGhc = true;
        };
        ltex = {
          enable = true;
          filetypes = [
            "latex"
            "tex"
            "bib"
          ];
          extraOptions = {
            use_spellfile = true;
          };
        };
      };
    };
    lint.enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>cl";
      action = "<cmd>LspInfo<cr>";
      options.desc = "Lsp Info";
    }
  ];
}
