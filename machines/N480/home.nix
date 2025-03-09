# Home-manager configuration

{ inputs, outputs, lib, config, pkgs, ... }:

{

  imports =
    [
      
    ];


  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      ad = import ../../modules/home-manager/default.nix;
    };
  };

}