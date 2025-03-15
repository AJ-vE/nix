# Home-manager configuration

{ inputs, outputs, lib, config, pkgs, plasma-manager, ... }:

{

  home-manager = {

    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ];

    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      ad = import ./users/user1.nix;
    };
  };

}