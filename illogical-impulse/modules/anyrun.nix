anyrun: illogical-impulse-dotfiles: inputs: { config, lib, pkgs, ... }:
let
  cfg = config.illogical-impulse;
in
{
  config = lib.mkIf (cfg.enable) {
    programs.anyrun = {
      enable = true;
      config = {
        plugins = with inputs.anyrun.packages.${pkgs.system}; [
          applications
          randr
          rink
          shell
          symbols
        ];

        x = { fraction = 0.500000; };
        y = { absolute = 15; };
        width = { fraction = 0.300000; };
        height = { absolute = 0; };
        hideIcons = false;
        ignoreExclusiveZones = false;
        layer = "overlay";
        hidePluginInfo = true;
        closeOnClick = true;
        showResultsImmediately = false;
        maxEntries = null;
      };

      extraCss = builtins.readFile ../config/anyrun/style.css;
    };
  };
}
