{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, ... }:
    let
      pkgsForSystem = { system }: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      homeConfigurations.Linux = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgsForSystem { system = "x86_64-linux"; };
        modules = [
          ./home
        ];
      };
      nixosConfigurations =
        {
          nixos = nixpkgs.lib.nixosSystem rec {
            system = "x86_64-linux";
            pkgs = pkgsForSystem { system = "x86_64-linux"; };
            modules = [
              ./systems/nixos/configuration.nix
            ];
          };
        };
    };
}
