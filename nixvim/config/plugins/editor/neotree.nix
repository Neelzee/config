{ ... }:
let
  icons = {
    diagnostics = {
      BoldError = " ";
      Error = " ";
      BoldWarning = " ";
      Warning = " ";
      BoldInformation = " ";
      Information = " ";
      BoldQuestion = " ";
      Question = " ";
      BoldHint = " ";
      Hint = " ";
      Debug = " ";
      Trace = "✎ ";
    };

    git = {
      LineAdded = " ";
      LineModified = " ";
      LineRemoved = " ";
      FileDeleted = "󱂥 ";
      FileIgnored = " ";
      FileRenamed = " ";
      FileConflict = "󰩌 ";
      FileStaged = "✓ ";
      FileUnmerged = " ";
      FileUnstaged = " ";
      FileUntracked = " ";
      Diff = " ";
      Repo = " ";
      Octoface = " ";
      Branch = " ";
    };

    ui = {
      Time = " ";
    };
  };
in
{
    plugins.neo-tree = {

      enable = true;
      closeIfLastWindow = true;
      sources = [
        "filesystem"
        "buffers"
        "git_status"
        "document_symbols"
      ];
      popupBorderStyle = "rounded"; # “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code

      filesystem = {
        bindToCwd = false;
        useLibuvFileWatcher = true;
        followCurrentFile.enabled = true;
      };

      defaultComponentConfigs = {
        gitStatus = {
          symbols = {
            added = icons.git.LineAdded;
            conflict = icons.git.FileConflict;
            deleted = icons.git.FileDeleted;
            ignored = icons.git.FileIgnored;
            modified = icons.git.LineModified;
            renamed = icons.git.FileRenamed;
            staged = icons.git.FileStaged;
            unstaged = icons.git.FileUnstaged;
            untracked = icons.git.FileUntracked;
          };
        };
      };

      window.mappings = {
        "<space>" = "none";
        # Allows for collapsing/uncollapsing folders using h-l
        "l" = "open";
        "h" = "close_node";
        "P" = "toggle_preview";
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<cr>";
        options = {
          silent = true;
          desc = "Explorer NeoTree (root dir)";
        };
      }
    ];
}

