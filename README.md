# Dotfiles

This repository contains my personal dotfiles for ease of transitioning to
other devices. Feel free to check them out, copy them, or modify them.

Currently trying to have my config files managed with Stow and installed packages managed with Nix (work in progress).

## Stow

Dotfiles managed by [stow](https://www.gnu.org/software/stow).

- From the home directory `~`, run `stow <module>` where `module` is folder nme in this repo. Stow should then place them in the correct path.

## Nix

Slowly adding more [Nix](https://nixos.org/) configurations for easier setup and an eventual move to NixOS ❄️

1. install Nix package manager.
2. Add the `nix` config from this repo
3. Run `nix run home-manager/master -- init --switch` to initialize `home-manager`
4. Run `home-manager switch` to install packages.

## Tmux

Don't forget to clone recursively for submodules until I find a way to ignore the tmux packages properly.

## Other

VSCode is synced with the built-in sync via my GitHub account

## Credits

- Everyone for their open-source projects!
