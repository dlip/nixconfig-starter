{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    ...
  }: let
    users = {
      me = {
        # CHANGE ME TO YOUR USER
        name = "Jane Doe";
        username = "jdoe";
        homeDirectory = "/home/jdoe";
        email = "jane.doe@example.com";
      };
      docker = {
        name = "Docker User";
        username = "root";
        homeDirectory = "/root";
        email = "docker@example.com";
      };
    };
    pkgsForSystem = {
      system,
      pkgs ? nixpkgs,
    }:
      import pkgs {
        inherit system;
        config.allowUnfree = true;

        # Allows you to use an unstable package with pkgs.unstable.<foo>
        overlays = [
          (final: prev: {
            unstable = pkgsForSystem {
              inherit system;
              pkgs = nixpkgs-unstable;
            };
          })
        ];
      };
  in {
    homeConfigurations = {
      docker = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgsForSystem {system = "aarch64-linux";};
        modules = [
          ./home/default.nix
          {
            home = {
              username = "root";
              homeDirectory = "/root";
              email = "docker@example.com";
              name = "Docker Name";
              stateVersion = "23.11";
            };
          }
        ];
      };
    };
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        pkgs = pkgsForSystem {system = "x86_64-linux";};
        modules = [
          ./systems/nixos/configuration.nix
          ./systems/common/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              # CHANGE 'jdoe' TO YOUR USERNAME
              users.jdoe = {
                imports = [
                  ./home/default.nix
                  ./home/graphical.nix
                ];
              };

              extraSpecialArgs = {
                user = users.me;
              };
            };
          }
        ];
      };
    };
  };
}
