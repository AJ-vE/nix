# Home-manager configuration

{ inputs, outputs, lib, config, pkgs, ... }:

{

  imports = [
    ../../../modules/home-manager/default.nix  # Shared home-manager config
  ];

  home = {
    username = "ad";
    homeDirectory = "/home/ad";
  };

}