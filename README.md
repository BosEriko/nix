# Nix (Package Manager)
Download [Nix](https://nixos.org/download/) as your package manager. Run the commands below on the Terminal.
``` sh
passwd                                                                # Set your password
sudo chown -R deck /nix                                               # Set the permissions
sh <(curl -L https://nixos.org/nix/install) --no-daemon               # Install Nix
```
Then run the command below on the Terminal again.
``` sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/BosEriko/nix/HEAD/install.sh)"
```
