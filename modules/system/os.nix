{ pkgs, lib, config, ... }: 


let
  cfg = config.os;
  inherit (lib) mkEnableOption mkIf mkOption;
in
{

  options.os = {
    enable = mkEnableOption "enables os";
  };

  config = lib.mkIf cfg.enable {

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Nix store garbage collection
    nix.optimise.automatic = true;
    nix.optimise.dates = [ "03:45" ];
    nix.gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 14d";
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

  };
  
}