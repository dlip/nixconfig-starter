{ config, pkgs, ... }:
{
  home.username = "Linux";
  home.homeDirectory = "/root";
  home.stateVersion = "22.05";

  programs.home-manager.enable = true;

  imports = [
    ./git.nix
  ];
}
