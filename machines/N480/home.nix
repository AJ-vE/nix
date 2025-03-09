# Home-manager configuration

{ inputs, outputs, lib, config, pkgs, ... }:

{

  inputs.home-manager.useGlobalPkgs = true;
  inputs.home-manager.useUserPackages = true;
  inputs.home-manager.sharedModules = [ inputs.plasma-manager.homeManagerModules.plasma-manager ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      ad = import ./users/user1.nix;
    };
  };

}