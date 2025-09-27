{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    
    # MOVED: home-manager now goes inside the inputs block
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      # url = "github:nix-community/nixvim";
      # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
      url = "github:nix-community/nixvim/nixos-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # MOVED: nix-flatpak also goes inside the inputs block
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    
    catppuccin.url = "github:catppuccin/nix/release-25.05";

  }; # <- This is the single, correct closing brace for the entire inputs block

  outputs = { self, nixpkgs, nix-flatpak, home-manager, nixvim, catppuccin, ... }@inputs: {
    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        nix-flatpak.nixosModules.nix-flatpak
        ./configuration.nix
	catppuccin.homeModules.catppuccin
        home-manager.nixosModules.default
        {
          home-manager.users.anklus.imports = [
              nixvim.homeManagerModules.nixvim
          ];
        }
      ];
    };
  };
}
