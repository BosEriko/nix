#!/usr/bin/env bash
set -e

# Remove Old Channel
nix-channel --remove nixpkgs 2>/dev/null || true

# Add New Channel
nix-channel --add https://nixos.org/channels/nixos-25.11 nixpkgs
nix-channel --update

# Allow Paid Applications
export NIXPKGS_ALLOW_UNFREE=1

# Install Applications
nix-env -iA nixpkgs.discord # Used in https://github.com/BosEriko/sway
nix-env -iA nixpkgs.spotify # Used in https://github.com/BosEriko/sway

echo "Done ✅"
