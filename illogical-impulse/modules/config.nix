{ config, ... }:

let
  # Creates a symlink from nix-store to target directory
  configDir = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/illogical-impulse/config";
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
  home.file = xdgFiles;
}
