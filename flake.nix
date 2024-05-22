{
  description = "Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: {
    homeConfigurations = {
      "cirius" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/os/nix/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users = {
              "cirius" = import ./home.nix;
            };
            # TODO: move modules to home directory
            imports = [
              ./modules/shell.nix
              ./modules/shared/git.nix
              ./modules/hyprland.nix
            ];
          }
        ];
      };
    };

    # homeConfigurations = {
    #  "cirius" = home-manager.lib.homeManagerConfiguration {
    #  pkgs = import nixpkgs { system = "x86_64-linux"; };
    #  modules = [ ./modules/home.nix ./modules/shell.nix ./modules/shared/git.nix ./modules/hyprland.nix ]; # Defined later
    # };
    # };
  };
}
