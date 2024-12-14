Flake does not include untracked files, so remember to add new/moved files.

```shell
home-manager switch -f ~/Documents/nix-config/hosts/laptop/home.nix
```

```shell
sudo nixos-rebuild switch --flake ~/Documents/nix-config#laptop
```


## TODO

- [ ] Seperate modules into system/home-manager
- [ ] Create neovim config
