{ config, pkgs, ... }:

{

  # ⚙️ NixVim Configuration
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin = {
      enable = true;
      settings = {
      # Set the 'mocha' flavor
      flavour = "mocha";
      };
    };   

    plugins = {
      plugins.indent-blankline = {
        enable = true;
        settings.scope = {
          show_start = lib.nixvim.raw "false"; 
          show_end = lib.nixvim.raw "false";
          enabled = true;
          highlight = lib.nixvim.raw "require('catppuccin.groups.integrations.ibl').get()";
          animate = {
            enabled = true;
            duration = 500;
          };
        };
      };
    };
  };
}
