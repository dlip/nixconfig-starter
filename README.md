# nixconfig-starter

A Nix/NixOS configuration using flakes to help you get started quickly

## Getting Started

- Fork this repo if you want to be able to save your customizations. For example, name it nixconfig.

### Docker

```
docker-compose run --name mynix nix bash
home-manager switch --flake .#docker
```

Note: be careful of running `docker system prune` while the container is stopped since it will delete it

```
docker start -i mynix
```

### NixOS

- Download the [ISO](https://nixos.org/download.html#nixos-iso) and write it to a flash drive
- Install using the GUI installer or terminal
- After rebooting into the system `git clone` your fork of the repo

```
nix-shell -p git
git clone https://github.com/<GITHUB_USER>/nixconfig.git
cd nixconfig
cp /etc/nixos/*.nix systems/nixos
nixos-rebuild boot --flake .#nixos
sudo reboot
```
