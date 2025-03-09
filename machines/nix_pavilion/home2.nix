# Home-manager configuration

{ inputs, outputs, lib, config, pkgs, ... }:

{


  home = {
    username = "admin";
    homeDirectory = "/home/admin";
  };

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";

}