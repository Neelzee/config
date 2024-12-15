#!/usr/bin/env bash
set -e
pushd ~/Documents/nix-config
git diff -U0 .
git add **.nix
sudo nixos-rebuild switch --flake ~/Documents/nix-config#laptop &>nixos-switch.log || (cat nixos-switch.log | grep --color error && false)
home-manager switch -f ~/Documents/nix-config/hosts/laptop/home.nix &>home-manager-switch.log || (cat home-manager-switch.log | grep --color error && false)
gen=$(nixos-rebuild list-generations | grep current)
git commit -am "$gen"
popd
