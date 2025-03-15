# Home-manager configuration

{ inputs, outputs, lib, config, pkgs, ... }:

{

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  home.stateVersion = "24.11";

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # Plasma manager
  programs.plasma = {
    enable = true;
    workspace.wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Path/contents/images/2560x1600.jpg";
  }
  
}