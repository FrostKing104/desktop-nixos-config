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

      indent-blankline = {
        enable = true;
        settings.scope = {
          # Enable the animated scope line (must be a raw Lua function)
          show_start = config.lib.nixvim.raw "false";
          show_end = config.lib.nixvim.raw "false";
          enabled = true;
          # Use config.lib.nixvim.raw to insert raw Lua code:
          highlight = config.lib.nixvim.raw "require('catppuccin.groups.integrations.ibl').get()"; 
          animate = {
            enabled = true;
            # 500ms animation duration
            duration = 500; 
          };
        };
      };
    };
  };
}
