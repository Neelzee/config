{ ... }:
{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers.typos_lsp.enable = true;
      keymaps.lspBuf = {
        "<c-k>" = "signature_help";
        "gi" = "implementation";
      };
    };
    lint.enable = true;
  };
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>cl";
      action = "<cmd>LspInfo<cr>";
      options.desc = "Lsp Info";
    }
  ];
}
