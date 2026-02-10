{ config, pkgs, lib, ... }:

# NeoVim Directory
let
  lazyvimDir = "${config.home.homeDirectory}/.config/nvim";
in

{
  nixpkgs.config.allowUnfree = true;

  home.username = "deck";
  home.homeDirectory = "/home/deck";

  programs.bash = {
    enable = true;
    initExtra = ''
      if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
        . $HOME/.nix-profile/etc/profile.d/nix.sh
      fi

      export NIX_SHELL_PRESERVE_PROMPT=1
      if [[ -n "$IN_NIX_SHELL" ]]; then
        export PS1="$PS1(nix-shell) "
      fi
    '';
  };

  # Don't change this even if you upgrade your channel in the future
  # It should mirror the version of 'nixpkgs' and 'home-manager' when you do 'nix-channel --list'
  home.stateVersion = "25.11"; 

  home.packages = with pkgs; [
    neovim       # NeoVim Text Editor
    sway         # Sway: Window Manager
    swaybg       # Sway: Background Tool
    waybar       # Sway: Status bar
    foot         # Sway: Terminal
  ];

  programs.home-manager.enable = true;

  # NeoVim Configuration
  home.activation.lazyvim = lib.mkIf ( ! builtins.pathExists lazyvimDir ) ''
    export PATH=${pkgs.git}/bin:$PATH
    mkdir -p $HOME/.config/nvim
    git clone https://github.com/LazyVim/starter $HOME/.config/nvim
  '';

  # nixGL Installation (Sway Dependency)
  home.activation.nixgl = ''
    ! nix-channel --list | grep -q "nixgl" && nix-channel --add https://github.com/guibou/nixGL/archive/main.tar.gz nixgl && nix-channel --update
    nix-env -q nixGL || nix-env -iA nixgl
  '';
}
