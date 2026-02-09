{ config, pkgs, lib, ... }:

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

  home.stateVersion = "25.11"; # don't change this even if you upgrade your channel in the future

  home.packages = with pkgs; [
    neovim
  ];

  programs.home-manager.enable = true;

  # Automatically clone LazyVim if it's not already installed
  home.activation.lazyvim = lib.mkIf ( ! builtins.pathExists lazyvimDir ) ''
    export PATH=${pkgs.git}/bin:$PATH
    echo "Installing LazyVim..."
    mkdir -p $HOME/.config/nvim
    git clone https://github.com/LazyVim/starter $HOME/.config/nvim
  '';
}
