# Home-manager configuration

{ inputs, outputs, lib, config, pkgs, ... }:

{

  home-manager = {

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];

    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      ad = import ./users/user1.nix;
    };
  };

}