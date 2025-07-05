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
   nix run home-manager/release-25.05 -- switch -b .bak --impure --flake .#tekeoglan
   ```

## Structure

*   `flake.nix`: The entry point for the Nix Flake, defining inputs and outputs.
*   `home.nix`: The main Home Manager configuration file.
*   `modules/`: A directory containing modularized parts of the configuration.
*   `config/`: Contains the raw configuration files that are symlinked by Home Manager.

## Customization

To customize this configuration, you can edit the files in the `modules/` and `config/` directories. After making changes, run the `nix run home-manager/release-25.05 -- switch -b .bak --impure --flake .#tekeoglan` command again to apply them.

## License

This repository is licensed under the [MIT License](LICENSE).
