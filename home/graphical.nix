{ config, pkgs, user, ... }:
{
  imports = [
    ./fonts.nix
    ./vscode.nix
  ];
  home.packages = with pkgs; [
    dbeaver
    google-chrome
    lens
  ];
}
