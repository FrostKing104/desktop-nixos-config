{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    
    # MOVED: home-manager now goes inside the inputs block
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    # MOVED: nix-flatpak also goes inside the inputs block
    nix-flatpak.url = "github:gmodena/nix-flatpak";

  }; # <- This is the single, correct closing brace for the entire inputs block

  outputs = { self, nixpkgs, nix-flatpak, home-manager, ... }@inputs: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        nix-flatpak.nixosModules.nix-flatpak
        ./configuration.nix
        home-manager.nixosModules.default
      ];
    };
  };
}
