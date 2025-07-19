# Tekeoglan's Dotfiles

This repository contains my personal dotfiles, managed with [Nix](https://nixos.org/) and [Home Manager](https://github.com/nix-community/home-manager). This setup allows for reproducible and declarative configuration of my user environment. You should also check out the easy installation method for Nix via [Determinate Systems](https://determinate.systems/posts/determinate-nix-installer).

## Prerequisites

Before you begin, ensure you have [Nix](https://nixos.org/download.html) installed on your system. This configuration is built using Nix Flakes, so you'll need to enable that feature.

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/tekeoglan/dotfiles ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Install Nixgl:**
    
    ```bash
    nix-channel --add https://github.com/nix-community/nixGL/archive/main.tar.gz nixgl && nix-channel --update
    nix-env -iA nixgl.auto.nixGLDefault
    ```

    > [!CAUTION]
    > You could also install nixGL using Home Manager, but it seems that way you won't get the necessary packages for nixGL to work.

3. **Activate the configuration:**

   This command builds and activates the Home Manager configuration specified in `flake.nix`.

   ```bash
   home-manager switch -b bak --impure --flake .#tekeoglan
   ```

4. **Create a session file:**

    ```bash
    sudo tee /usr/share/wayland-sessions/hyprland.desktop > /dev/null << 'EOF'
    [Desktop Entry]
    Name=Hyprland
    Comment=An intelligent dynamic tiling Wayland compositor
    Exec=env GBM_BACKEND=default XDG_SESSION_TYPE=wayland nixGL Hyprland
    Type=Application
    DesktopNames=Hyprland
    Keywords=tiling;wayland;compositor;
    EOF
    ```

    If you have nvdia gpu, check out [here](https://github.com/Tramscan/ubuntu-nix-config).

## Structure

*   `flake.nix`: The entry point for the Nix Flake, defining inputs and outputs.
*   `home.nix`: The main Home Manager configuration file.
*   `modules/`: A directory containing modularized parts of the configuration.
*   `config/`: Contains the raw configuration files that are symlinked by Home Manager.
*   `illogical-impulse/`: Contains the configuration files that relate to [illogical-impulse](https://github.com/end-4/dots-hyprland).

## Customization

To customize this configuration, you can edit the files in the `modules/` and `config/` directories. After making changes, run the `home-manager switch -b bak --impure --flake .#tekeoglan` command again to apply them.

## References

Here are some repositories I used as inspiration for my configuration:
- [nix-config](https://github.com/ryan4yin/nix-config)  
- [end-4-dots-hyprland-nixos](https://github.com/xBLACKICEx/end-4-dots-hyprland-nixos)
- [ubuntu-nix-config](https://github.com/Tramscan/ubuntu-nix-config)


## License

This repository is licensed under the [MIT License](LICENSE).
