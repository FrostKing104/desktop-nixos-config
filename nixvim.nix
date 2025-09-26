{ config, pkgs, inputs, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # DELETE THE LINE BELOW - IT'S INCORRECT AND NOT NEEDED
    # colorschemes.catppuccin.from = "${inputs.nix-colors}/themes/catppuccin.nix";

    # These settings are all you need for the theme to work.
    # When you enable the catppuccin plugin, nixvim automatically finds it.
    colorscheme = "catppuccin";
    plugins.catppuccin = {
      enable = true;
      flavour = "mocha";
    };

    # Basic options
    opts = {
      number = true;
      relativenumber = true;
    };

    # Enable a few useful plugins
    plugins = {
      lualine.enable = true;
      gitsigns.enable = true;
    };
  };
}
