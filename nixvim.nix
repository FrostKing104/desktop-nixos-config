{ config, pkgs, inputs, ... }:

{
  # All your NixVim settings go in here
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # Import themes from nix-colors
    colorschemes.catppuccin.from = "${inputs.nix-colors}/themes/catppuccin.nix";

    # Set the colorscheme and flavour
    colorscheme = "catppuccin";
    plugins.catppuccin = {
      enable = true;
      flavour = "mocha"; # frappe, macchiato, mocha
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
