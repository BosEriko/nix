#!/usr/bin/env bash
set -e

VERSION=$(cat .nix-version)

echo "Setting up Nix channels for version $VERSION"

# Remove old channel
nix-channel --remove nixpkgs 2>/dev/null || true

# Add new channel
nix-channel --add https://nixos.org/channels/nixos-$VERSION nixpkgs
nix-channel --update

# Installing Applications
nix-env -iA nixpkgs.discord # Used in https://github.com/BosEriko/sway
nix-env -iA nixpkgs.spotify # Used in https://github.com/BosEriko/sway

echo "Done ✅"
