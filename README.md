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

2. **Activate the configuration:**

   This command builds and activates the Home Manager configuration specified in `flake.nix`.

   ```bash
   home-manager switch -b bak --impure --flake .#tekeoglan
   ```

## Structure

*   `flake.nix`: The entry point for the Nix Flake, defining inputs and outputs.
*   `home.nix`: The main Home Manager configuration file.
*   `modules/`: A directory containing modularized parts of the configuration.
*   `config/`: Contains the raw configuration files that are symlinked by Home Manager.
*   `illogical-impulse/`: Contains the configuration files that relate to [illogical-impulse](https://github.com/end-4/dots-hyprland).

## Customization

To customize this configuration, you can edit the files in the `modules/` and `config/` directories. After making changes, run the `home-manager switch -b bak --impure --flake .#tekeoglan` command again to apply them.

## Disclaimer

Since Nix can't make system-wide changes on non-NixOS distributions, I had to install `Hyprland` using Fedora's package manager. If you're using NixOS, I've included the Hyprland-related configurations for reference.

## References

Here are some repositories I used as inspiration for my configuration:
- [nix-config](https://github.com/ryan4yin/nix-config)  
- [end-4-dots-hyprland-nixos](https://github.com/xBLACKICEx/end-4-dots-hyprland-nixos)


## License

This repository is licensed under the [MIT License](LICENSE).
