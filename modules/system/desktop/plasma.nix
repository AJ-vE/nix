{ pkgs, lib, config, ... }: 


let
  cfg = config.plasma;
  inherit (lib) mkEnableOption mkIf mkOption;
in
{

  options.plasma = {
    enable = mkEnableOption "enables plasma";
    someName = mkOption {
      default = "nixName";
      description = "this be a description";
    };
  };

  config = lib.mkIf cfg.enable {

    # Enable the X11 windowing system.
    # You can disable this if you're only using the Wayland session.
    services.xserver.enable = true;

    # Enable the KDE Plasma Desktop Environment.
    services.desktopManager.plasma6.enable = true;
    services.displayManager.defaultSession = "plasma";
    services.displayManager.sddm.wayland.enable = true;

  };
  
}

