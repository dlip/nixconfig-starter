{ config, pkgs, user, ... }:
{
  home.packages = with pkgs; [
    awscli2
    clamav
    docker-compose
    pciutils
    unzip
    wget
    zip
  ];
}
