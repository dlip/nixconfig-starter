{ config, pkgs, user, ... }:
{
  home.packages = with pkgs; [
    awscli2
    docker-compose
    pciutils
    unzip
    wget
    zip
  ];
}
