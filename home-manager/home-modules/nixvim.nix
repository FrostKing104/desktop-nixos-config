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
    
    plugins.treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };
    
    plugins.mini = {
      enable = true;
      modules.indentscope = {
        symbol = "▎";
        options = {
          try_as_border = true;
        };
      };
    };
    
    plugins.indent-blankline = {
      enable = true;
      settings = {
        indent = {
          char = "│";
          tab_char = "│";
        };
        scope = {
          enabled = true;
          char = "▎";  # Thicker character makes animations more visible
          show_start = true;
          show_end = true;
          show_exact_scope = true;
          injected_languages = false;
          highlight = [ "Function" "Label" ];
          priority = 500;
        };
        exclude = {
          filetypes = [
            "help"
            "alpha"
            "dashboard"
            "neo-tree"
            "Trouble"
            "trouble"
            "lazy"
            "mason"
            "notify"
            "toggleterm"
            "lazyterm"
          ];
        };
      };
    };
  };
}
