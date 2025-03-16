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

  # GRAPHICS

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
    # of just the bare essentials.
    powerManagement.enable = true;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer). (not this one)
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };

  # ONLY FOR LAPTOPS

  hardware.nvidia.prime = {
    sync.enable = true;
    
		# Make sure to use the correct Bus ID values for your system!
    # 'sudo lshw -c display'
		intelBusId = "PCI:0:2:0";
		nvidiaBusId = "PCI:01:0:0";
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
  
  networking.hostName = "nix-pavilion"; # Define your hostname.

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

  ### MOONLIGHT #######################
  
  environment.systemPackages = with pkgs; [
    moonlight-qt
  ];

  ### OTHERS ##########################

}