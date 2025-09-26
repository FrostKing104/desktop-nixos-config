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
    plugins.treesitter = {
      enable = true;

      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        json
        lua
        make
        markdown
        nix
        regex
        toml
        vim
        vimdoc
        xml
        yaml
      ];
    };
  };
}
