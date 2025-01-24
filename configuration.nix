{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/common.nix
  ];

  # Automatic updating
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  # Automatic cleanup
  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 10d";
    };
    settings = {
      auto-optimise-store = true;
    };
  };

  nixpkgs.config.permittedInsecurePackages = [
    "dotnet-sdk-6.0.428"
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  services = {
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      # Enable the GNOME Desktop Environment.
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      # Configure keymap in X11
      xkb = {
        layout = "no";
        variant = "";
      };
    };
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Configure console keymap
  console.keyMap = "no";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.users.nmf = {
    isNormalUser = true;
    description = "Nils Michael Fitjar";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    # For eduroam
    # Download this script: https://cat.eduroam.org/
    # And run it, so, not declerative 😢
    packages = [
      (pkgs.python3.withPackages (python-pkgs: [
        python-pkgs.dbus-python
      ]))
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    vim
    spotify
    xclip
    alacritty
    starship
    tmux
    zip
    unzip
    nodePackages.eslint_d
    godot_4-mono
    jetbrains.rider
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    noto-fonts-emoji
    fira-code
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  ## Enables flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
