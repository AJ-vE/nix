# Home-manager configuration

{ inputs, outputs, lib, config, pkgs, ... }:

{


  home = {
    username = "ad";
    homeDirectory = "/home/ad";
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  ad.stateVersion = "24.11";

}