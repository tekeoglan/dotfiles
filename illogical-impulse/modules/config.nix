{ lib, ... }:

let
  # Creates a symlink from nix-store to target directory
  configDir = lib.file.mkOutOfStoreSymlink builtins.toString ../config;
  entries = builtins.readDir configDir;

  # Dynamically sources all the folders or files under '.dotfiles/config' to '.config' folder
  xdgFiles = builtins.listToAttrs (
    builtins.map (name: {
      name = ".config/${name}";
      value = {
        source = (configDir + "/${name}");
        recursive = true;
      };
    }) (builtins.attrNames entries)
  );

in {
  home.file = lib.mkMerge [
    xdgFiles
  ];
}
