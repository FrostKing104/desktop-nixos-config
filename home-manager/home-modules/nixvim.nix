{ config, pkgs, ... }:

{

  # ⚙️ NixVim Configuration
  programs.nixvim = {
    enable = true;
    
    # Basic Configuration Example:
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # Options (equivalent to :set in Vim/Neovim)
    opts = {
      # Sets the number of screen lines to keep above and below the cursor
      scrolloff = 8; 
      # Enable mouse support
      mouse = "a"; 
      # Highlight the current line
      cursorline = true;
    };

    # Plugins Example:
    plugins = {
      lualine.enable = true; # Status line
      treesitter.enable = true; # Syntax highlighting
    };

    # Colorscheme Example:
    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };
  };


}
