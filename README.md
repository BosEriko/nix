# Nix (Package Manager)
Download [Nix](https://nixos.org/download/) as your package manager. Run the commands below on the Terminal.
``` sh
passwd                                                                # Set your password
sudo chown -R deck /nix                                               # Set the permissions
sh <(curl -L https://nixos.org/nix/install) --no-daemon               # Install Nix
git clone https://github.com/BosEriko/nix.git ~/.config/home-manager  # Clone the repository
~/.config/home-manager/setup.sh                                       # Setup Nix
```

## Nix Commands
After every update of `~/.config/home-manager/home.nix` make sure to run switch.
```sh
home-manager switch
```
To remove unwanted packages make sure to run garbage collection every now and then.
```sh
nix-collect-garbage
```
