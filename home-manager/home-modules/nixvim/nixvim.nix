{ config, pkgs, inputs, ... }:
let
  nixvimLib = inputs.nixvim.lib;
  lspConfig = import ./nixvim-lsp.nix { inherit config pkgs; };
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
        draw = {
          delay = 67;  # Default is 100ms, this is ~1.5x faster (100/1.5 ≈ 67)
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
          enabled = false;  # Disable scope since we're using mini.indentscope
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
    
    plugins.telescope = {
      enable = true;
      keymaps = [
        { key = "<leader>f"; action = "<cmd>Telescope find_files<CR>"; mode = "n"; desc = "Find Files"; }
      ];
    };

    plugins.gitsigns = {
      enable = true;
    };

    plugins.plenary = {
      enable = true;
    };

  } // lspConfig;
}
