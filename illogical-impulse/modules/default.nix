{...}:
{
  imports = [
    ./options.nix 
    ./anyrun.nix
    ./quickshell.nix
    # ./hyprland.nix I'cant setup this on fedora, so I deactivate this for now.
    ./packages.nix
    ./config.nix
  ];
}
