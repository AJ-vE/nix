# Configuration file specific to N480

{ inputs, lib, config, pkgs, ... }:

{
  
  imports =
    [
      ./N480-hardware-configuration.nix  # Include the results of the hardware scan.
      ./common.nix  # Include the shared config.
    ];

  ### HARDWARE ########################
  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Mount a NFS drive
  fileSystems."/mnt/serverdrive" = {
    device = "192.168.2.6:/bigdrive";
    fsType = "nfs";
    options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" ];
  };

  ### OS ##############################

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ad = {
    isNormalUser = true;
    description = "ad minster";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # user-specific packages
    ];
  };

  ### NETWORKING ######################
  
  networking.hostName = "N480"; # Define your hostname.

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  ### OTHERS ##########################

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}