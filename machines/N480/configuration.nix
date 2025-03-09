# Configuration file specific to N480

{ inputs, lib, config, pkgs, ... }:

{
  
  imports =
    [
      # machine-specific modules
      ./hardware-configuration.nix  # Include the results of the hardware scan.

      # shared modules
      ../../modules/common/default.nix

      # home-manager
      ./home.nix
    ];

  ### HARDWARE ########################
  
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

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11"; # Did you click the link?

}