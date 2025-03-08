# Imports only

{ config, pkgs, ... }:

{

  imports =
    [
      ./hardware-configuration.nix  # Include the results of the hardware scan.
      /home/USRNAME/.nixfiles/common.nix  # Shared configuration.
      /home/USRNAME/.nixfiles/PCNAME.nix  # Specific to this machine.
    ];

}