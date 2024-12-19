{ pkgs, ... }:
{
  home.packages = with pkgs; [
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
