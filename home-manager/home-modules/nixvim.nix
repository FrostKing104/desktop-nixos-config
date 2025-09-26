{ config, pkgs, inputs, ... }:

let
  nixvimLib = inputs.nixvim.lib;
in
{
  programs.nixvim = {
    enable = true;

    opts.mapleader = " ";
    opts.maplocalleader = " ";

    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
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

      treesitter = {
        enable = true;
        settings.ensure_installed = [ "python" "bash" "nix" "lua" ];
        settings.highlight.enable = true;
        settings.indent.enable = true;
      };

      lspconfig.enable = true; # Enable the lspconfig plugin

      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = { action = "find_files"; options.desc = "Find Files"; };
          "<leader>fg" = { action = "live_grep"; options.desc = "Live Grep"; };
          "<leader>fb" = { action = "buffers"; options.desc = "Find Buffers"; };
        };
      };
    }; # End of 'plugins'

    # 🟢 THE FIX IS HERE: 'lsp' is a top-level option under programs.nixvim
    lsp = {
      enable = true; # Enable general LSP features
      servers = { # Define servers here
        pyright.enable = true;
        bashls.enable = true;
        # ⚠️ NOTE: 'nil' is defined under the 'servers' block, which is correct
        nil.enable = true; 
      };
    };

  };
}
