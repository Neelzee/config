{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Rust
    rustc
    cargo
    # Haskell
    ghc
    # Python
    python3
    # Node
    nodejs
  ];
}

