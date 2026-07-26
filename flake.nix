{

  description = "NixOS configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = {self, nixpkgs, ...}@inputs:
  let 
    inherit (self) outputs;
    system = "x86_64-linux";
  in {

    nixosConfigurations = {

      N480 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs system;};
        modules = [
          ./machines/N480/configuration.nix
          ./machines/N480/hardware-configuration.nix
          ./modules
        ];
      };

      nix-pavilion = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs system;};
        modules = [
          ./machines/nix_pavilion/configuration.nix
          ./machines/nix_pavilion/hardware-configuration.nix
          ./modules
        ];
      };

    };

  };

}