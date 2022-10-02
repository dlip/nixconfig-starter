{ config, pkgs, user, ... }:
{
  home.username = user.username;
  home.homeDirectory = user.homeDirectory;
  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  imports = [
    ./git.nix
  ];
}
