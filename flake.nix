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
      users = {
        jdoe = {
          name = "Jane Doe";
          username = "jdoe";
          homeDirectory = "/home/jdoe";
          email = "jdoe@example.com";
        };
        docker = {
          name = "Example User";
          username = "Linux";
          homeDirectory = "/root";
          email = "user@example.com";
        };
      };
      pkgsForSystem = { system }: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      homeConfigurations = {
        docker = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsForSystem { system = "x86_64-linux"; };
          modules = [
            ./home
          ];
          extraSpecialArgs = {
            user = users.docker;
          };
        };
      };
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          pkgs = pkgsForSystem { system = "x86_64-linux"; };
          modules = [
            ./systems/nixos/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.jdoe = import ./home;
                extraSpecialArgs = {
                  user = users.jdoe;
                };
              };
            }
          ];
        };
      };
    };
}
