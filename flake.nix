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

    apollo-flake = {
      url = "github:username/apollo-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-flatpak, apollo-flake, nixpkgs-unstable, ... }@inputs:
    let
      # Define linuxPkgsUnstable here, so it's available to nixosSystem
      linuxPkgsUnstable = import nixpkgs-unstable {
        system = "x86_64-linux";
      };
    in
    {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs linuxPkgsUnstable; }; # Pass it to the modules
        modules = [
          nix-flatpak.nixosModules.nix-flatpak
          ./configuration.nix
          inputs.home-manager.nixosModules.default
          # This line should now work
          apollo-flake.nixosModules.${linuxPkgsUnstable.system}.default
          ({ pkgs, ... }: {
            services.apollo.package = apollo-flake.packages.${pkgs.system}.default;
          })
        ];
      };
    };
}
