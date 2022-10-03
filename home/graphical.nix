{ config, pkgs, user, ... }:
{
  home.packages = with pkgs; [
    firefox
  ];
}
