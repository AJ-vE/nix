# Home-manager configuration

{ inputs, outputs, lib, config, pkgs, ... }:

{

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  home.stateVersion = "24.11";

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.sharedModules = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];

}