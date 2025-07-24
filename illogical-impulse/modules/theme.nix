{ config, pkgs, lib, ... }:
let
  cfg = config.illogical-impulse;
  cursor = config.illogical-impulse.theme.cursor;
in
{
  config = lib.mkIf cfg.enable {

    home.sessionVariables = {
      XCURSOR_THEME = cursor.theme;
      XCURSOR_SIZE = 24;
    };

    home.pointerCursor = {
      enable = true;
      gtk.enable = true;
      package = cursor.package;
      name = cursor.theme;
      size = 32;
    };

    home.file.".local/share/icons/MoreWaita" = {
      source = "${pkgs.morewaita-icon-theme}/share/icons";
    };
  };
}
