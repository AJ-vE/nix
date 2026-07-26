{ pkgs, lib, config, ... }: 


let
  cfg = config.firefox;
  inherit (lib) mkEnableOption mkIf mkOption;
in
{

  options.firefox = {
    enable = mkEnableOption "enables firefox";
  };

  config = lib.mkIf cfg.enable {

    programs.firefox = {
      enable = true;
      package = pkgs.librewolf;
      policies = {
        # https://mozilla.github.io/policy-templates/#searchengines--default
        # Not all policies will work though. Maybe none.
        SearchEngines = {
          Default = "DuckDuckGo";
        };
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        Preferences = {
          "webgl.disabled" = false;
          "cookiebanners.service.mode.privateBrowsing" = 2; # Block cookie banners in private browsing
          "cookiebanners.service.mode" = 2; # Block cookie banners
          "privacy.donottrackheader.enabled" = true;
          "privacy.fingerprintingProtection" = true;
          "privacy.resistFingerprinting" = true;
          "privacy.trackingprotection.emailtracking.enabled" = true;
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.fingerprinting.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
        };
        ExtensionSettings = {
          "jid1-ZAdIEUB7XOzOJw@jetpack" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/duckduckgo-for-firefox/latest.xpi";
            installation_mode = "force_installed";
          };
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "force_installed";
          };
          "tab-stash@condordes.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/tab-stash/latest.xpi";
            installation_mode = "force_installed";
          };
        };
      };
    };

  };
  
}