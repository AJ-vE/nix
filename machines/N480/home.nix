# Home-manager configuration

{ inputs, lib, config, pkgs, ... }:

{

  imports =
    [
      inputs.home-manager.nixosModules.home-manager
      ../../modules/home-manager/default.nix
    ];


  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      ad = import ../../modules/home-manager/configuration.nix;
    };
  };

}