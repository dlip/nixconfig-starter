{ config, pkgs, user, ... }:
{
  imports = [
    ./git.nix
    ./bash.nix
    ./zsh.nix
    ./nvim.nix
    ./starship.nix
  ];

  home.username = user.username;
  home.homeDirectory = user.homeDirectory;
  home.stateVersion = "22.05";
  programs.home-manager.enable = true;
  programs.direnv.enable = true;

  home.packages = with pkgs; [
    wget
    unzip
    zip
    docker-compose
  ];
}
