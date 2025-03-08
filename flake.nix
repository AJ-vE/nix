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
  in {

    nixosConfigurations = {

      N480 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./N480.nix];
      };

      # nix_pavilion = nixpkgs.lib.nixosSystem {
      #   specialArgs = { inherit inputs; };
      #   system = "x86_64-linux";
      #   modules = [
      #     ./configs/common/configuration.nix
      #     ./configs/nix_pavilion/configuration.nix
      #   ];
      # };
      
    };

  };

}