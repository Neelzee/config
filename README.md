Flake does not include untracked files, so remember to add new/moved files.

```shell
home-manager switch -f ~/Documents/nix-config/home.nix
```

```shell
sudo nixos-rebuild switch --flake ~/Documents/nix-config#default
```

## To-do

- [ ] Separate modules into system/home-manager
- [x] Create neovim config
