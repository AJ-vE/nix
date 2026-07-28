{ pkgs, lib, config, ... }: 


let
  cfg = config.thing;
  inherit (lib) mkEnableOption mkIf mkOption;
in
{

  options.thing = {
    enable = mkEnableOption "enables thing";
    someName = mkOption {
      default = "nixName";
      description = "this be a description";
    };
  };

  config = lib.mkIf cfg.enable {

  };
  
}