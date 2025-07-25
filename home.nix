{ ... }:
let
  username = "tekeoglan";
  homeDirectory = "/home/tekeoglan";
in
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = homeDirectory;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  nix.gc = {
    automatic = true;
    frequency = "weekly"; 
    options = "--delete-older-than 7d";
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tekeoglan/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # set '.nix-profile/bin' path so that the other programs detect nix installed programs
    PATH="$PATH:${homeDirectory}/.nix-profile/bin";
  };

  home.sessionPath = [
    "$HOME/.nix-profile/bin" # binaries
    "$HOME/.nix-profile/share/applications" # .desktop files
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
