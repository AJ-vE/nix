# Configuration file specific to N480

{ inputs, lib, config, pkgs, ... }:

{

  ### HARDWARE ########################

  ### USERS ###########################

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ad = {
    isNormalUser = true;
    description = "ad minster";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # user-specific packages
    ];
  };

  ### OTHERS ##########################

  basic-networking.hostName = "N480"; # Define your hostname.

  hardware.keyboard.qmk.enable = true;

  os.enable = true;
  plasma.enable = true;
  aliases.enable = true;
  firefox.enable = true;
  audio.enable = true;
  locale.enable = true;
  basic-networking.enable = true;

}