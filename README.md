# nixconfig-starter

A Nix/NixOS configuration using flakes to help you get started quickly

## Docker getting started

```
docker-compose run --name mynix nix bash
home-manager switch --flake .#Linux
```

Note: be careful of running `docker system prune` while the container is stopped since it will delete it

```
docker start -i mynix
```
