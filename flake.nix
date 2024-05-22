{
  description = "Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      cirius = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./internal/profile/nix/configuration.nix
          ./internal/profile/nix/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users = {
              cirius = import ./internal/profile/nix/home/home.nix;
            };
          }
        ];
      };
      hieutran = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./internal/profile/mac/configuration.nix
          ./internal/profile/mac/hardware-configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users = {
              hieutran = import ./internal/profile/mac/home/home.nix;
            };
          }
        ];
      };
    };

    home-manager = {
      inherit nixpkgs;
      modules = [
        ./internal/shared/home/home.nix
      ];
    };
  };
}
