{ config, pkgs, inputs, ... }:

let
  nixvimLib = inputs.nixvim.lib;
in
{
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
      };
    };

    plugins = {
      indent-blankline = {
        enable = true;
        settings.scope = {
          show_start = nixvimLib.raw "false";
          show_end = nixvimLib.raw "false";
          enabled = true;
          highlight = nixvimLib.raw "require('catppuccin.groups.integrations.ibl').get()";
          animate = {
            enabled = true;
            duration = 500;
          };
        };
      };
    };
  };
}
