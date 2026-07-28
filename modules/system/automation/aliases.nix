{ pkgs, lib, config, ... }: {

  options = {
    aliases.enable = 
      lib.mkEnableOption "enables aliases";
  };

  config = lib.mkIf config.aliases.enable {
    
    environment.shellAliases = {
      syncswitch = "cwd=$(pwd) && cd /etc/nixos && echo '\nPulling config files from git...' && git pull && echo '\nRebuilding NixOS...' && sudo nixos-rebuild switch --flake /etc/nixos && cd $cwd";
      syncrebuild = "cwd=$(pwd) && cd /etc/nixos && echo '\nPulling config files from git...' && git pull && echo '\nRebuilding NixOS...' && sudo nixos-rebuild boot --flake /etc/nixos && cd $cwd";
      syncreboot = "syncrebuild && sudo reboot now";
      quickpush = "cwd=$(pwd) && cd /etc/nixos && echo '\nPulling...' && git pull && echo '\nCommitting...' && git add . && git commit -m 'Quick commit, default message' && echo '\nPushing...' && git push && cd $cwd";
    };

  };
}