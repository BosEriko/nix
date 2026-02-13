# Nix (Package Manager)
Download [Nix](https://nixos.org/download/) as your package manager. Run the commands below on the Terminal.
``` sh
passwd                                                                # Set your password
sudo chown -R deck /nix                                               # Set the permissions of the /nix directory
sh <(curl -L https://nixos.org/nix/install) --no-daemon               # Install Nix package manager
source .bash_profile                                                  # Source the current bash session
git clone https://github.com/BosEriko/nix.git ~/.config/home-manager  # Clone the repository
~/.config/home-manager/setup.sh                                       # Setup channels
mv .bash_profile .bash_profile.bckp && mv .bashrc .bashrc.bckp        # Backup your Bash configurations
nix-shell '<home-manager>' -A install                                 # Install Home Manager
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
