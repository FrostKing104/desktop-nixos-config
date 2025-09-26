{ config, pkgs, inputs, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # This is the correct place for the theme's settings
    colorschemes.catppuccin = {
      enable = true;
      flavour = "mocha";
    };

    # Basic options
    opts = {
      number = true;
      relativenumber = true;
    };

    # Other plugins (lualine, etc.) still go here
    plugins = {
      lualine.enable = true;
      gitsigns.enable = true;
    };
  };
}
