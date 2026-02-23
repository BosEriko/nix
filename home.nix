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
    brave                     # Browser: Brave (https://github.com/BosEriko/brave)
  ];

  programs.home-manager.enable = true;
}
