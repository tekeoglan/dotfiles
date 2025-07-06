# End‑4‑Dots‑Hyprland for NixOS

Original repo:  [end-4/dots-hyprland](https://github.com/end-4/dots-hyprland/)

Inspired by  [bigsaltyfishes/end-4-dots](https://github.com/bigsaltyfishes/end-4-dots)

This is the QuickShell variant (not the AGS), tailored for use with NixOS and Home Manager modules.

##  Usage

**Import the module in your `configuration.nix`:**

```nix
{
    imports = [
        inputs.illogical-impulse.homeManagerModules.default
    ];
}
```

**Configure `illogical-impulse` in your module settings:**

```nix
illogical-impulse = {
    # Enable the dotfiles suite
    enable = true;

    hyprland = {
        # Use customized Hyprland build
        package = hypr.hyprland;
        xdgPortalPackage = hypr.xdg-desktop-portal-hyprland;

        # Enable Wayland ozone
        ozoneWayland.enable = true;
    };

    # Dotfiles configurations
    dotfiles = {
        anyrun.enable = true;
        fish.enable = true;
        kitty.enable = true;
    };
};
```
