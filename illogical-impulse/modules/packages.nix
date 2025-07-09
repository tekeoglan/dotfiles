{ config, lib, pkgs, inputs, ... }:
let
  cfg = config.illogical-impulse;
  selfPkgs = import ../pkgs {
    inherit pkgs;
  };
in
{
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      # # AUDIO #
      cava
      lxqt.pavucontrol-qt
      wireplumber
      libdbusmenu-gtk3
      playerctl

      # # BACK LIGNT#
      brightnessctl
      ddcutil

      # # BASIC #
      axel
      bc
      # coreutils
      cliphist
      # cmake
      curl
      rsync
      wget
      libqalculate
      ripgrep
      jq
      # meson
      fish
      fuzzel
      matugen
      mpv
      mpvpaper

      xdg-user-dirs

      # # FONT THEMES #
      adw-gtk3
      #   breeze-plus #TODO need monaula install
      eza
      #   fish
      #   fontconfig
      python313Packages.kde-material-you-colors
      (config.lib.nixGL.wrap kitty)
      #   matugen
      starship
      #   # ttf-readex-pro #TODO need monaula install
      #   # ttf-jetbrains-mono-nerd
      material-symbols
      rubik
      inputs.nur.legacyPackages."${system}".repos.skiletro.gabarito
      selfPkgs.illogical-impulse-oneui4-icons
      # # HYPRLAND #
      wl-clipboard

      # # KDE #
      kdePackages.bluedevil
      gnome-keyring
      # networkmanager # normal handel with nixos services
      kdePackages.plasma-nm
      kdePackages.polkit-kde-agent-1

      # # SCREEN CAPUTUER #
      wf-recorder
      # hyprshot
      tesseract
      slurp

      # # TOOLKIT #
      upower
      wtype
      ydotool

      # # PYTHON #
      #   # clang
      # uv
      #   gtk4
      #   libadwaita
      libsoup_3
      libportal-gtk4
      gobject-introspection
      sassc
      opencv
      (python3.withPackages (python-pkgs: with python-pkgs; [
        build
        pillow
        setuptools-scm
        wheel
        pywayland
        psutil
        materialyoucolor
        libsass
        material-color-utilities
        setproctitle
      ]))


      # # WIDGETS #
      glib
      swww
      translate-shell
      (config.lib.nixGL.wrap wlogout)

    ] ++ (with pkgs.nerd-fonts; [
      # nerd fonts
      ubuntu
      ubuntu-mono
      jetbrains-mono
      caskaydia-cove
      fantasque-sans-mono
      mononoki
      space-mono
      fira-code
    ]);

    services.gammastep.enable = true;
    services.gammastep.provider = "geoclue2";
    services.network-manager-applet.enable = true;
  };
  # home.packages = with pkgs; [

  # # AUDIO #
  #   cava
  #   pavucontrol-qt
  #   wireplumber
  #   libdbusmenu-gtk3
  #   playerctl

  # # BACK LIGNT#
  #   gammastep
  #   geoclue
  #   brightnessctl
  #   ddcutil

  # # BASIC #
  #   axel
  #   bc
  #   # coreutils
  #   cliphist
  #   # cmake
  #   curl
  #   rsync
  #   wget
  #   ripgrep
  #   jq
  #   # meson
  #   # xdg-user-dirs

  # # FONT THEMES #
  #   adw-gtk-theme-git
  #   breeze-plus
  #   eza
  #   fish
  #   fontconfig
  #   kde-material-you-colors
  #   kitty
  #   matugen
  #   starship
  #   # ttf-readex-pro
  #   # ttf-jetbrains-mono-nerd
  #   # ttf-material-symbols-variable-git
  #   # ttf-rubik-vf
  #   # ttf-gabarito-git

  # # HYPRLAND #
  #   # hyprutils
  #   # hyprpicker
  #   # hyprlang
  #   # hypridle
  #   # hyprland-qt-support
  #   # hyprland-qtutils
  #   # hyprlock
  #   # hyprcursor
  #   # hyprwayland-scanner
  #   # hyprland
  #   # xdg-desktop-portal-hyprland
  #   wl-clipboard

  # # KDE #
  #   bluedevil
  #   gnome-keyring
  #   networkmanager
  #   plasma-nm
  #   polkit-kde-agent
  #   systemsettings

  # # PYTHON #
  #   # clang
  #   uv
  #   gtk4
  #   libadwaita
  #   libsoup3
  #   libportal-gtk4
  #   gobject-introspection
  #   sassc
  #   # python-opencv

  # # SCREEN CAPUTUER #
  #   swappy
  #   wf-recorder
  #   hyprshot
  #   tesseract
  #   slurp

  # # TOOLKIT #
  #   kdialog
  #   kdePackages.5compat
  #   kdePackages.base
  #   kdePackages.declarative
  #   kdePackages.imageformats
  #   kdePackages.multimedia
  #   kdePackages.positioning
  #   kdePackages.quicktimeline
  #   kdePackages.sensors
  #   kdePackages.svg
  #   kdePackages.tools
  #   kdePackages.translations
  #   kdePackages.virtualkeyboard
  #   kdePackages.wayland
  #   syntax-highlighting
  #   upower
  #   wtype
  #   ydotool

  # # WIDGETS #
  #   fuzzel
  #   glib2 # for `gsettings` it seems?
  #   # hypridle
  #   # hyprutils
  #   # hyprlock
  #   # hyprpicker
  #   nm-connection-editor
  #   quickshell
  #   swww
  #   translate-shell
  #   wlogout
  # ];

}
