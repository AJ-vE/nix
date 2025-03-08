# Imports only

{ config, pkgs, ... }:

{

  imports =
    [
      ./hardware-configuration.nix  # Include the results of the hardware scan.
      ./common.nix  # Shared configuration.
      ./N480.nix  # Specific to this machine.
    ];

}