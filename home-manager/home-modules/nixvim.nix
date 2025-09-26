{ config, pkgs, inputs, ... }: # ⬅️ Must include 'inputs'

let
  # Define a shorthand for the nixvim library, accessing it directly from the flake input.
  nixvimLib = inputs.nixvim.lib;
in
{
  # ⚙️ NixVim Configuration
  programs.nixvim = {
    enable = true;

    # Set the Neovim leader key
    opts.mapleader = " ";
    opts.maplocalleader = " ";

    # 1. Catppuccin Mocha Colorscheme 🎨
    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };

    # 2. Plugins Configuration
    plugins = {
      # ⚠️ FIX: Removed the extra 'plugins' nesting here. It should be plugins.<plugin-name> = { ... }
      
      # Indent-blankline (Indentscope animated line) 🌲
      indent-blankline = {
        enable = true;
        settings.scope = {
          # ✅ FIX: Using the robust 'nixvimLib.raw'
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

      # Treesitter (Syntax Highlighting)
      treesitter = {
        enable = true;
        settings.ensure_installed = [ "python" "bash" "nix" "lua" ];
        settings.highlight.enable = true;
        settings.indent.enable = true;
      };
      
      lsp.enable = true;
      lspconfig.enable = true; # Enable the lspconfig plugin

      # Define servers here (under programs.nixvim.lsp.servers)
      lsp.servers = {
        pyright.enable = true;
        bashls.enable = true;
        nil.enable = true;
      };

      # Telescope (Fuzzy Finder) 🔭
      telescope = {
        enable = true;
        keymaps = {
          "<leader>ff" = { action = "find_files"; options.desc = "Find Files"; };
          "<leader>fg" = { action = "live_grep"; options.desc = "Live Grep"; };
          "<leader>fb" = { action = "buffers"; options.desc = "Find Buffers"; };
        };
      };
    };
  };
}
