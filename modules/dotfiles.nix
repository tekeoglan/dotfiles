{ config, lib, ... }:

let
  # Creates a symlink from nix-store to target directory
  baseDir = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles";
  configDir = "${baseDir}/config";
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

  homeFiles = {
    ".bashrc" = { source = "${baseDir}/.bashrc"; };
  };

in {
  home.file = lib.mkMerge [
    xdgFiles
    homeFiles
  ];
}
