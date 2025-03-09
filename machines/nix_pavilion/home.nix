# Home-manager configuration

{ inputs, outputs, lib, config, pkgs, ... }:

{

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      # Import your home-manager configuration
      admin = import ./users/user1.nix;
    };
  };

}