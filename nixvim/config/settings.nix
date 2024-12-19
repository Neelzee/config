{ config, pkgs, inputs, ... }:
{
    clipboard.register = "unnamedplus";
    opts = {
      number = true;         # Show line numbers
      relativenumber = true; # Show relative line numbers

      shiftwidth = 2;        # Tab width should be 2
    };
}
