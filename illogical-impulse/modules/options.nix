{ pkgs, lib, ... }:
with lib;
{
  options.illogical-impulse = {
    enable = mkEnableOption "Enable illogical-impulse";
    hyprland = {
      enable = mkEnableOption "Enable hyprland";
      monitor = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ",preferred,auto,1" ];
        description = "Monitor preferences for Hyprland";
      };
      package = lib.mkOption {
        type = lib.types.package;
        default = pkgs.hyprland;
        description = "Hyprland package";
      };
      xdgPortalPackage = lib.mkOption {
        type = lib.types.package;
        default = pkgs.xdg-desktop-portal-hyprland;
        description = "xdg-desktop-portal package for Hyprland";
      };
    };
    anyrun = {
      enable = mkEnableOption "Enable anyrun";
    };
  };
}
