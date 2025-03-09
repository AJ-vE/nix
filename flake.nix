{

  description = "NixOS configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {self, nixpkgs, home-manager, ...}@inputs:
  let 
    inherit (self) outputs;
    system = "x86_64-linux";
  in {

    nixosConfigurations = {

      N480 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs system;};
        modules = [
          inputs.home-manager.nixosModules.home-manager
          ./machines/N480/configuration.nix
          ];
      };

      nix_pavilion = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs system;};
        modules = [
          inputs.home-manager.nixosModules.home-manager
          ./machines/nix_pavilion/configuration.nix
        ];
      };

    };

  };

}