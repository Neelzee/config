{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Rust
    rustc
    cargo
    # Haskell
    ghc
    stack
    # Python
    python3
    # Node
    nodejs
  ];
}
