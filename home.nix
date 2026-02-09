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
        neovim           # Main Editor

        # NeoVim Dependencies
        gcc              # C compiler
        make             # Required by Tree-sitter
        pkg-config       # Sometimes needed for building parsers
        clang            # Optional alternative compiler
  ];

  programs.home-manager.enable = true;
}
