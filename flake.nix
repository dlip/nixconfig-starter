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
        user = {
          # CHANGE ME TO YOUR USER
          name = "Jane Doe";
          username = "jdoe";
          homeDirectory = "/home/jdoe";
          email = "jane.doe@example.com";
        };
        root = {
          name = "Root User";
          username = "root";
          homeDirectory = "/root";
          email = "root@example.com";
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
            user = users.root;
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
                # CHANGE ME TO YOUR USERNAME
                users.jdoe = import ./home;
                extraSpecialArgs = {
                  user = users.user;
                };
              };
            }
          ];
        };
      };
    };
}
