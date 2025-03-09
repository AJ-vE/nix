# Configuration file specific to nix_pavilion

{ config, pkgs, ... }:

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
  
  fileSystems."/mnt/bigdrive" = {
    device = "/dev/disk/by-uuid/9311cbd8-6e68-4866-a273-890781c7f916";
    fsType = "ext4";
    options = [ # If you don't have this options attribute, it'll default to "defaults" 
      # boot options for fstab. Search up fstab mount options you can use
      "nofail" # Prevent system from failing if this drive doesn't mount
    ];
  };

  ### OS ##############################

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.admin = {
    isNormalUser = true;
    description = "admin of strater";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # user-specific packages
    ];
  };

  ### NETWORKING ######################
  
  networking.hostName = "nix_pavilion"; # Define your hostname.

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  ### NFS

  fileSystems."/export/bigdrive" = {
    device = "/mnt/bigdrive";
    options = [ "bind" ];
  };

  services.nfs.server.enable = true;
  services.nfs.server.exports = ''
    /export           192.168.2.7(rw,fsid=0,no_subtree_check)
    /export/bigdrive  192.168.2.7(rw,nohide,insecure,no_subtree_check)
  '';

  networking.firewall.allowedTCPPorts = [ 2049 ];

  ### OTHERS ##########################

}