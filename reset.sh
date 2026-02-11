#!/bin/bash

# Remove existing home.nix configuration
rm -rf ~/.config/home-manager/home.nix

# Download the latest home.nix from the repository
curl -o ~/.config/home-manager/home.nix https://raw.githubusercontent.com/BosEriko/nix/refs/heads/master/home.nix

# Apply the configuration changes
home-manager switch

# Clean up unused Nix packages
nix-collect-garbage
