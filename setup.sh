#!/usr/bin/env bash

VERSION=$(cat .nix-version)

echo "Setting up Nix channels for version $VERSION"

nix-channel --remove nixpkgs 2>/dev/null
nix-channel --remove home-manager 2>/dev/null

nix-channel --add https://nixos.org/channels/nixos-$VERSION nixpkgs
nix-channel --add https://github.com/nix-community/home-manager/archive/release-$VERSION.tar.gz home-manager

nix-channel --update
