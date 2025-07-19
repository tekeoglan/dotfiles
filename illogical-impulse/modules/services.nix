{ config, lib, ...}:
let
  cfg = config.illogical-impulse;
in
{
  config = lib.mkIf (cfg.enable && cfg.hyprland.enable) {
    services.swww.enable = true;
  };
}
