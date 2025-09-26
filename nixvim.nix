{ config, pkgs, inputs, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    colorscheme = "catppuccin";

    # ADD "-nvim" TO THE LINE BELOW
    plugins.catppuccin-nvim = {
      enable = true;
      flavour = "mocha";
    };

    opts = {
      number = true;
      relativenumber = true;
    };

    plugins = {
      lualine.enable = true;
      gitsigns.enable = true;
    };
  };
}
