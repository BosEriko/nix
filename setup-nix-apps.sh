#!/bin/bash
# setup-nix-apps.sh
# Automates adding ALL Nix-installed apps to Steam Deck applications menu

# Step 1: Ensure XDG_DATA_DIRS is set in ~/.bashrc
if ! grep -q '/home/deck/.nix-profile/share' ~/.bashrc; then
  echo 'export XDG_DATA_DIRS="/home/deck/.nix-profile/share${XDG_DATA_DIRS:+:$XDG_DATA_DIRS}"' >> ~/.bashrc
  echo "Added XDG_DATA_DIRS to ~/.bashrc"
else
  echo "XDG_DATA_DIRS already set in ~/.bashrc"
fi

# Step 2: Create symlinks for ALL desktop files
mkdir -p ~/.local/share/applications
for desktop_file in /home/deck/.nix-profile/share/applications/*.desktop; do
  target="$HOME/.local/share/applications/$(basename "$desktop_file")"
  if [ ! -L "$target" ]; then
    ln -s "$desktop_file" "$target"
    echo "Symlink created for $(basename "$desktop_file")"
  else
    echo "Symlink already exists for $(basename "$desktop_file")"
  fi
  chmod +x "$target"
done

echo "✅ All Nix-installed apps should now appear in your applications menu after restarting your session."
