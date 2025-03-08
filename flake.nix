{

  description = "NixOS configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = {self, nixpkgs, ... }:
    let 
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {

      nixosConfigurations = {

        N480 = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          system = "x86_64-linux";
          modules = [
            ./hardware-configuration.nix
            ./configs/common/configuration.nix
            ./configs/N480/configuration.nix
          ];
        };

        nix_pavilion = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          system = "x86_64-linux";
          modules = [
            ./hardware-configuration.nix
            ./configs/common/configuration.nix
            ./configs/nix_pavilion/configuration.nix
          ];
        };

      };

    };

}