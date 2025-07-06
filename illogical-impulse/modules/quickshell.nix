{ config, lib, pkgs-us, inputs, ... }:
let
  cfg = config.illogical-impulse;
in
{
  config = lib.mkIf cfg.enable {
    gtk = {
      enable = true;
      iconTheme = {
        package = pkgs-us.adwaita-icon-theme;
        name = "Adwaita";
      };
    };
    qt = {
      enable = true;
      platformTheme.name = "kde6";
    };
    home.sessionVariables.ILLOGICAL_IMPULSE_VIRTUAL_ENV = "~/.local/state/quickshell/.venv";

    home.packages = with pkgs-us; [
      inputs.quickshell.packages.${pkgs-us.system}.default
      kdePackages.kdialog
      kdePackages.qt5compat
      kdePackages.qtbase
      kdePackages.qtdeclarative
      kdePackages.qtdeclarative
      kdePackages.qtimageformats
      kdePackages.qtmultimedia
      kdePackages.qtpositioning
      kdePackages.qtquicktimeline
      kdePackages.qtsensors
      kdePackages.qtsvg
      kdePackages.qttools
      kdePackages.qttranslations
      kdePackages.qtvirtualkeyboard
      kdePackages.qtwayland
      kdePackages.syntax-highlighting
    ];
  };
}
