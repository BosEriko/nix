#!/usr/bin/env bash
set -e

VERSION=$(cat .nix-version)

echo "Setting up Nix channels for version $VERSION"

# Remove Old Channel
nix-channel --remove nixpkgs 2>/dev/null || true

# Add New Channel
nix-channel --add https://nixos.org/channels/nixos-$VERSION nixpkgs
nix-channel --update

# Install Applications
NIXPKGS_ALLOW_UNFREE=1 nix-env -iA nixpkgs.discord # Used in https://github.com/BosEriko/sway
NIXPKGS_ALLOW_UNFREE=1 nix-env -iA nixpkgs.spotify # Used in https://github.com/BosEriko/sway

echo "Done ✅"
