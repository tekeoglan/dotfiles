{ config, lib, pkgs, ... }:
let
  enabled = config.illogical-impulse.enable;
  hypr = config.illogical-impulse.hyprland.package;
  hypr-xdg = config.illogical-impulse.hyprland.xdgPortalPackage;
in
{
  config = lib.mkIf enabled {
    home.packages = with pkgs; [
      hyprpicker
      hyprlock
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
      xwayland.enable = true;
      package = hypr;
      portalPackage = hypr-xdg;

      # settings = {
      #   env = [
      #     "GIO_EXTRA_MODULES, ${pkgs.gvfs}/lib/gio/modules:$GIO_EXTRA_MODULES"
      #   ] ++ (lib.optionals hyprlandConf.ozoneWayland.enable [
      #     "NIXOS_OZONE_WL, 1"
      #   ]);
      #   exec = [
      #     "hyprctl dispatch submap global" # DO NOT REMOVE THIS OR YOU WON'T BE ABLE TO USE ANY KEYBIND
      #   ];
      #   submap = "global"; # This is required for catchall to work
      #
      #   debug.disable_logs = false;
      #
      #   monitor = hyprlandConf.monitor;
      # };
      #
      # extraConfig = ''
      #   # Defaults
      #   source=~/.config/hypr/hyprland/execs.conf
      #   source=~/.config/hypr/hyprland/general.conf
      #   source=~/.config/hypr/hyprland/rules.conf
      #   source=~/.config/hypr/hyprland/colors.conf
      #   source=~/.config/hypr/hyprland/keybinds.conf
      #
      #   # Custom 
      #   source=~/.config/hypr/custom/env.conf
      #   source=~/.config/hypr/custom/execs.conf
      #   source=~/.config/hypr/custom/general.conf
      #   source=~/.config/hypr/custom/rules.conf
      #   source=~/.config/hypr/custom/keybinds.conf
      # '';

    };

    services.hypridle = {
      enable = true;
    };
  };
}
