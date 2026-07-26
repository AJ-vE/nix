{ pkgs, lib, config, ... }: 

let
  cfg = config.basic-networking;
in
{

  options.basic-networking = {
    enable = 
      lib.mkEnableOption "enables module1";

    hostName = lib.mkOption {
      default = "nixMachine";
      description = "networking hostname";
    };
  };

  config = lib.mkIf cfg.enable {

    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Enable networking
    networking.networkmanager.enable = true;

    # Enable Bluetooth
    hardware.bluetooth.enable = true;

    networking.hostName = cfg.hostName; # Define your hostname.
    networking.nameservers = ["1.1.1.1"];  # DNS

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  };
}