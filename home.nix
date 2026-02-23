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
    swayfx                    # Window Manager: SwayFX (https://github.com/BosEriko/sway)
    waybar                    # Window Manager: Status bar (https://github.com/BosEriko/sway)
    nerd-fonts.jetbrains-mono # Window Manager: Mono Font (https://github.com/BosEriko/sway)
    brave                     # Browser: Brave (https://github.com/BosEriko/brave)
    foot                      # Shell: Foot (https://github.com/BosEriko/foot)
    neovim                    # Editor: NeoVim (https://github.com/BosEriko/codium)

    # Dependencies
    tmux         # Used in ~/.files/modules/tmux/install.z.sh
    discord      # Used in ~/.config/sway/config
    spotify      # Used in ~/.config/sway/config
    lolcat       # Used in ~/.files/modules/git/config.z.sh
    figlet       # Used in ~/.files/modules/git/config.z.sh
    antigen      # Used in ~/.files/modules/oh-my-zsh/config.z.sh
  ];

  programs.home-manager.enable = true;
}
