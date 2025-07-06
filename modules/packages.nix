{ pkgs, ... }:

{
  # Example: Install a package from the default (stable) channel
  home.packages = [
    pkgs.neovim
  ];

  # Example: Install a package specifically from the unstable channel
  # Let's say 'my-new-app' is only available or is a newer version in unstable
  # home.packages = home.packages ++ [ # Append to existing packages list
  #   unstablePkgs.my-new-app # <--- Installing 'my-new-app' from the unstable channel
  #   unstablePkgs.another-unstable-tool
  # ];

  # Example: If you want to use an unstable version of a package that's also in stable
  # e.g., a newer version of 'cowsay'
  # home.packages = home.packages ++ [
  #   unstablePkgs.cowsay # This will get the unstable cowsay
  # ];

  # Alternatively, for program configurations:
  # programs.some-program = {
  #   enable = true;
  #   package = unstablePkgs.some-program; # Force it to use the unstable version
  #   # ... other options
  # };
}
