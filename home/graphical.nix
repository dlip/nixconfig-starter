{ config, pkgs, user, ... }:
{
  imports = [
    ./fonts.nix
  ];
  home.packages = with pkgs; [
    firefox
  ];
}
