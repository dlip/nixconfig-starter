{ config, pkgs, user, ... }:
{
  imports = [
    ./packages.nix
    ./direnv.nix
    ./git.nix
    ./bash.nix
    ./zsh.nix
    ./nvim.nix
    ./starship.nix
  ];

  home.username = user.username;
  home.homeDirectory = user.homeDirectory;
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;
}
