{ pkgs, config, ... }:
{
  home.packages = with pkgs; let
    graphicalApps = [
      zotero
    ];
    wrappedApps = map config.lib.nixGL.wrap graphicalApps;
  in
    [
      neovim
      zellij
      lazygit
      ncspot
    ] ++ wrappedApps;
}
