{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Rust
    rustc
    cargo
    # Haskell
    ghc
  ];
}

