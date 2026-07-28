# Configuration file to be included in every machine.

{ inputs, lib, config, pkgs, ... }:

{

  imports = [
    ./system/networking/basic.nix
    ./system/automation/aliases.nix
    ./system/audio.nix
    ./system/desktop/plasma.nix
    ./system/locale.nix
    ./system/os.nix
    ./browsers/firefox.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # nixpkgs.config.allowInsecure = true;


  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1w"
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    kdePackages.kate
    vscodium
    obsidian
    lshw
    easyeffects
    roomeqwizard
    orca-slicer
    runescape
    runelite
    discord
    qbittorrent
  ];

  programs.steam.enable = true;

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
