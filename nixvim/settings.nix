{ ... }:
{
  programs.nixvim = {
    clipboard.register = "unnamedplus";

    opts = {
      # Show line numbers
      number = true;         
      # Show relative line numbers
      relativenumber = true; 
    };
  };
}
