{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  home.username = "deck";
  home.homeDirectory = "/home/deck";


  programs.bash = {
    enable = true;
    initExtra = ''
      if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi

      export NIX_SHELL_PRESERVE_PROMPT=1
      if [[ -n "$IN_NIX_SHELL" ]]; then
        export PS1="$PS1(nix-shell) "
      fi
    '';
  };

  home.stateVersion = "25.11"; # don't change this even if you upgrade your channel in the future, this should stay the same as the version you first installed nix on

  home.packages = with pkgs; [
        neovim
  ];

  programs.home-manager.enable = true;

  # Automatically clone LazyVim if it's not already installed
  home.activation.lazyvim = {
    text = ''
      if [ ! -d "$HOME/.config/nvim" ]; then
        echo "Installing LazyVim..."
        git clone https://github.com/LazyVim/starter "$HOME/.config/nvim"
      fi
    '';
    deps = [ pkgs.git ];
  };
}
