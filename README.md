# Nix (Package Manager)
Download [Nix](https://nixos.org/download/) as your package manager. Before we start, set the password first if still not available.
``` sh
passwd
```
Adjust the permission of the `nix` directory.
```sh
sudo chown -R deck /nix
```
Install Nix package manager.
```sh
sh <(curl -L https://nixos.org/nix/install) --no-daemon
```
Source the current bash session.
```sh
source .bash_profile
```
Switch to the stable channel of packages. Update the version to the latest stable if possible. Check the [Nix](https://nixos.org/) website for information.
```sh
nix-channel --add https://nixos.org/channels/nixos-25.11 nixpkgs
```
Add the Home Manager channel to your Nix configuration. Make sure the version on the command below mirrors the version on the command above.
```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager
```
Update your channels.
```sh
nix-channel --update
```
Backup your Bash configurations.
```sh
mv .bash_profile .bash_profile.bckp
mv .bashrc .bashrc.bckp
```
Install Home Manager
```sh
nix-shell '<home-manager>' -A install
```
Then create a configuration file on `~/.config/home-manager/home.nix` and add the contents of [home.nix](home.nix) inside it. After every update of the file make sure to run switch.
```sh
home-manager switch
```
To remove unwanted packages make sure to run garbage collection every now and then.
```sh
nix-collect-garbage
```
To reset your home-manager to a state from this repository you can run this command.
```sh
curl -sL https://raw.githubusercontent.com/BosEriko/nix/refs/heads/master/reset.sh | bash
```
