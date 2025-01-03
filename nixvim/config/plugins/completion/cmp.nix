{ lib, helpers, ... }:
{
  plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;

      cmdline = {
        "/" = {
          mapping.__raw = "cmp.mapping.preset.cmdline()";
          sources = [ { name = "buffer"; } ];
        };
        ":" = {
          mapping.__raw = "cmp.mapping.preset.cmdline()";
          sources = [
            { name = "path"; }
            {
              name = "cmdline";
              option.ignore_cmds = [
                "Man"
                "!"
              ];
            }
          ];
        };
      };

      filetype = {
        sql.sources = [
          { name = "buffer"; }
          { name = "vim-dadbod-completion"; }
        ];
      };

      settings = {
        mapping = {
          "<Tab>".__raw = ''
            cmp.mapping(function(fallback)
              local luasnip = require("luasnip")
              if luasnip.locally_jumpable(1) then
                luasnip.jump(1)
              else
                fallback()
              end
            end, { "i", "s" })
          '';

          "<S-Tab>".__raw = ''
            cmp.mapping(function(fallback)
              local luasnip = require("luasnip")
              if luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" })
          '';

          "<C-n>" = # lua
            "cmp.mapping(cmp.mapping.select_next_item())";
          "<C-p>" = # lua
            "cmp.mapping(cmp.mapping.select_prev_item())";
          "<C-e>" = # lua
            "cmp.mapping.abort()";
          "<C-d>" = # lua
            "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = # lua
            "cmp.mapping.scroll_docs(4)";
          "<Up>" = # lua
            "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Down>" = # lua
            "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<CR>" = # lua
            "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
          "<C-Space>" = # lua
            "cmp.mapping.complete()";
        };

        snippet.expand = # lua
          ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
      };
    };
  };
}
