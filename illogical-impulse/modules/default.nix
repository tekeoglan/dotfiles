self: anyrun: inputs: {... }:
{
  imports = [
    (import ./options.nix) 
    (import ./anyrun.nix anyrun inputs)
    (import ./quickshell.nix inputs)
    (import ./hyprland.nix inputs)
    (import ./packages.nix inputs)
    (import ./config.nix)
  ];
}
