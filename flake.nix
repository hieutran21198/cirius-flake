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
          ./modules/os/nix/hardware-configuration.nix
          ./modules/os/nix/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users = {
              "cirius" = import ./modules/os/nix/home/home.nix;
            };
          }
        ];
      };
    };
  };
}
