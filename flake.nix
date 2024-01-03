{
  description = "Home Manager configuration of bgottlob";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nix-darwin, home-manager, ... }:
  {
      homeConfigurations."bgottlob" = home-manager.lib.homeManagerConfiguration {
        modules = [ ./home.nix ];
      };

      darwinConfigurations = {
        acro = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./machines/acro/darwin-configuration.nix
            home-manager.darwinModules.home-manager
          ];
        };
      };
    };
}
