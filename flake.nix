{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-flatpak.url = "github:gmodena/nix-flatpak";

    # This is the corrected placement.
    apollo-flake = {
      url = "github:username/apollo-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-flatpak, apollo-flake, ... }@inputs: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
        # You need to define linuxPkgsUnstable here
        linuxPkgsUnstable = import inputs.nixpkgs-unstable {
          system = "x86_64-linux";
        };
      };
      modules = [
        nix-flatpak.nixosModules.nix-flatpak
        ./configuration.nix
        inputs.home-manager.nixosModules.default
        (inputs.apollo-flake.nixosModules.${linuxPkgsUnstable.system}.default)
        ({pkgs, ...}: {
          services.apollo.package = apollo-flake.packages.${pkgs.system}.default;
        })
      ];
    };
  };
}
