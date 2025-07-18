{ config, lib, pkgs, ... }:
let
  cfg = config.illogical-impulse;
  hypr = config.illogical-impulse.hyprland.package;
  hypr-xdg = config.illogical-impulse.hyprland.xdgPortalPackage;
  conf = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/illogical-impulse/config";
in
{
  config = lib.mkIf (cfg.enable && cfg.hyprland.enable) {

    xdg.configFile = {
      "hypr/custom".source = "${conf}/hypr/custom";
      "hypr/custom".recursive = true;
      "hypr/hyprland".source = "${conf}/hypr/hyprland";
      "hypr/hyprland".recursive = true;
      "hypr/hyprlock".source = "${conf}/hypr/hyprlock";
      "hypr/hyprlock".recursive = true;
      "hypr/shaders".source = "${conf}/hypr/shaders";
      "hypr/shaders".recursive = true;
      "hypr/default.conf".source = "${conf}/hypr/hyprland.conf";
      "hypr/hypridle.conf".source = "${conf}/hypr/hypridle.conf";
      "hypr/hyprlock.conf".source = "${conf}/hypr/hyprlock.conf";
    };

    home.sessionVariables = {
      NIXOS_OZONE_WL = "1";                   # Wayland support for Electron apps
      QT_QPA_PLATFORM = "wayland";            # Qt apps use Wayland
      GDK_BACKEND = "wayland";                # GTK apps use Wayland
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      XDG_SESSION_DESKTOP = "Hyprland";
      GBM_BACKEND = "default";
    };

    home.packages = with pkgs; [
      hyprpicker
      hyprlock
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      package = hypr;
      portalPackage = hypr-xdg;
      systemd = {
        enable = true;
        variables = ["--all"];
      };
      extraConfig = ''
        source=~/.config/hypr/default.conf
      '';
    };

    services.hypridle = {
      enable = true;
    };

    home.file.".local/share/wayland-sessions/hyprland.desktop".text = ''
      [Desktop Entry]
      Name=Hyprland
      Comment=Hyprland Wayland Compositor
      Exec=nixGL Hyprland
      Type=Application
      DesktopNames=Hyprland
    '';
  };
}
