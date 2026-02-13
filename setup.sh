#!/usr/bin/env bash
set -e

VERSION=$(cat .nix-version)

echo "Setting up Nix channels for version $VERSION"

# Remove old channels
nix-channel --remove nixpkgs 2>/dev/null || true
nix-channel --remove home-manager 2>/dev/null || true

# Add new channels
nix-channel --add https://nixos.org/channels/nixos-$VERSION nixpkgs
nix-channel --add https://github.com/nix-community/home-manager/archive/release-$VERSION.tar.gz home-manager

nix-channel --update

# Install Home Manager
echo "Installing Home Manager..."
nix-shell '<home-manager>' -A install

# Apply configuration
echo "Switching Home Manager configuration..."
home-manager switch

echo "Done ✅"
