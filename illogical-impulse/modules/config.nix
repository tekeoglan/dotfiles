# { config, ... }:
#
# let
#   # Creates a symlink from nix-store to target directory
#   configDir = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/illogical-impulse/config";
#   entries = builtins.readDir configDir;
#
#   # Dynamically sources all the folders or files under '.dotfiles/config' to '.config' folder
#   xdgFiles = builtins.listToAttrs (
#     builtins.map (name: {
#       name = ".config/${name}";
#       value = {
#         source = (configDir + "/${name}");
#         recursive = true;
#       };
#     }) (builtins.attrNames entries)
#   );
#
# in {
#   home.file = xdgFiles;
# }
{ config, ... }:

let
  # Creates a symlink from nix-store to target directory
  configDir = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/illogical-impulse/config";
  entries = builtins.readDir configDir;

  # Filter out the 'hypr' directory from the main list of entries
  # filteredEntries = builtins.filter (name: name != "hypr") (builtins.attrNames entries);

  # Dynamically sources all the folders or files under '.dotfiles/config' to '.config' folder,
  # excluding the 'hypr' directory.
  xdgFiles = builtins.listToAttrs (
    builtins.map (name: {
      name = ".config/${name}";
      value = {
        source = (configDir + "/${name}");
        recursive = true; # Maintain recursion for subdirectories
      };
    }) (builtins.attrNames entries)
  );
in {
  home.file = xdgFiles; # Merge the two sets of file symlinks
}
