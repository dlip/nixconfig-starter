{ config, pkgs, lib, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nixUnstable;
    settings.auto-optimise-store = true;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  virtualisation.docker.enable = true;
  networking.firewall.enable = true;

  # Antivirus
  services.clamav.daemon.enable = true;
  services.clamav.updater.enable = true;
}
