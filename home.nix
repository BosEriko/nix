{ config, pkgs, lib, ... }:

# Nix Dynamic Version
let
  version = builtins.readFile ./.nix-version;
in

{
  nixpkgs.config.allowUnfree = true;

  home.username = "deck";
  home.homeDirectory = "/home/deck";

  home.stateVersion = lib.strings.trim version;

  home.packages = with pkgs; [
    kmonad       # Keybinds: kmonad (https://github.com/BosEriko/kmonad)
    sway         # Window Manager: Sway (https://github.com/BosEriko/sway)
    waybar       # Window Manager: Status bar (https://github.com/BosEriko/sway)
    brave        # Browser: Brave (https://github.com/BosEriko/brave)
    foot         # Terminal: Foot (https://github.com/BosEriko/foot)
    vscodium     # Editor: VSCodium (https://github.com/BosEriko/codium)
    neovim       # Editor: NeoVim - VSCodium Dependency (https://github.com/BosEriko/codium)
  ];

  programs.home-manager.enable = true;
}
