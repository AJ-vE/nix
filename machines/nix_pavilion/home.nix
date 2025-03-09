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
      admin = import ./home2.nix;
    };
  };

}