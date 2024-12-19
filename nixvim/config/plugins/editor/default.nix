{ ... }:
{
  imports = [ ./neotree.nix ];
  plugins = {
    # Closing Pair
    nvim-autopairs = {
      enable = true;
    };
    # Better comments?
    ts-comments = {
      enable = true;
    };
    # Better search and replace
    grug-far = {
      enable = true;
    };
    # Flash enhances the built-in search functionality by showing labels at the
    # end of each match, letting you quickly jump to a specific location.
    flash = {
      enable = true;
    };
    # Shows next keybind
    which-key = {
      enable = true;
    };
    # Git signs highlights text that has changed since the list git commit, and
    # also lets you interactively stage & unstage hunks in a commit.
    gitsigns = {
      enable = true;
      settings = {
        signs = {
          add.text = "▎";
          change.text = "▎";
          delete.text = "";
          topdelete.text = "";
          changedelete.text = "▎";
          untracked.text = "▎";
        };
        signs_staged = {
          add.text = "▎";
          change.text = "▎";
          delete.text = "";
          topdelete.text = "";
          changedelete.text = "▎";
        };
      };
    };
    # better diagnostics list and others
    trouble = {
      enable = true;
      settings = {
        modes = {
          lsp = {
            win = { position = "right"; };
          };
        };
      };
    };
    # Indexes `TODO`
    todo-comments = {
      enable = true;
    };
    # formatting
    conform-nvim = {
      enable = true;
    };
    # fancy buffer-lines
    bufferline = {
      enable = true;
    };
  };
}
