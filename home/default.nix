{ config, pkgs, user, ... }:
{
  imports = [
    ./git.nix
  ];

  home.username = user.username;
  home.homeDirectory = user.homeDirectory;
  home.stateVersion = "22.05";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    vim
    direnv
    wget
    unzip
    zip
  ];
}
