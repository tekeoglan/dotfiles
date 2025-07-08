{ config, lib, pkgs, ... }:
let
  enabled = config.illogical-impulse.enable;
  hypr = config.illogical-impulse.hyprland.package;
  hypr-xdg = config.illogical-impulse.hyprland.xdgPortalPackage;
  mkSymlink = config.lib.file.mkOutOfStoreSymlink; 
  conf = "${config.home.homeDirectory}/.dotfiles/illogical-impulse/config";
in
{
  config = lib.mkIf enabled {

    home.packages = with pkgs; [
      hyprpicker
      hyprlock
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      package = (config.lib.nixGL.wrap hypr);
      portalPackage = hypr-xdg;
      systemd = {
        enable = true;
        variables = ["--all"];
      };
	    # settings = {
	    #   exec = ["hyprctl dispatch submap global"];
	    #   submap = "global";
	    # };
      extraConfig = ''
        source=~/.config/hypr/custom.conf
      '';
    };

    services.hypridle = {
      enable = true;
    };

  # NOTE: this executable is used by greetd to start a wayland session when system boot up
  # with such a vendor-no-locking script, we can switch to another wayland compositor without modifying greetd's config in NixOS module
    home.file.".wayland-session" = {
      source = "${hypr}/bin/Hyprland";
      executable = true;
    };

    xdg.configFile = {
      "hypr/custom".source = mkSymlink "${conf}/hypr/custom";
      "hypr/custom".recursive = true;
      "hypr/hyprland".source = mkSymlink "${conf}/hypr/hyprland";
      "hypr/hyprland".recursive = true;
      "hypr/hyprlock".source = mkSymlink "${conf}/hypr/hyprlock";
      "hypr/hyprlock".recursive = true;
      "hypr/shaders".source = mkSymlink "${conf}/hypr/shaders";
      "hypr/shaders".recursive = true;
      "hypr/custom.conf".source = mkSymlink "${conf}/hypr/custom.conf";
      "hypr/hypridle.conf".source = mkSymlink "${conf}/hypr/hypridle.conf";
      "hypr/hyprlock.conf".source = mkSymlink "${conf}/hypr/hyprlock.conf";
    };
  };
}
