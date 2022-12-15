{ config, pkgs, user, ... }:
{
  imports = [
    ./fonts.nix
  ];
  home.packages = with pkgs; [
    dbeaver
    google-chrome
    lens
  ];
}
