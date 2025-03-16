# Configuration file to be included in every machine.

{ inputs, lib, config, pkgs, ... }:

{

  ### HARDWARE ########################
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  ### OS ##############################

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "euro";
  };

  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma";
  services.displayManager.sddm.wayland.enable = true;

  ### SETTINGS ########################

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  ### COMMANDS ########################

  environment.shellAliases = {
    syncrebuild = "su && cwd=$(pwd) && cd /etc/nixos && echo '\nPulling config files from git...' && git pull && echo '\nRebuilding NixOS...' && nixos-rebuild boot --flake /etc/nixos && cd $cwd && exit";
    syncreboot = "syncrebuild && sudo reboot now";
    quickpush = "cwd=$(pwd) && cd /etc/nixos && echo '\nPulling...' && git pull && echo '\nCommitting...' && git add . && git commit -m 'Quick commit, default message' && echo '\nPushing...' && git push && cd $cwd";
  };

  ### NETWORKING ######################

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  ### AUDIO ###########################

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = false;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    # media-session.enable = true;
  };

  ### SOFTWARE ########################

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    kdePackages.kate
    vscodium
    librewolf
    obsidian
    lshw
    easyeffects
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  ### OTHER ###########################

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11"; # Did you click the link?

}
