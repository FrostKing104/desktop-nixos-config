{ config, pkgs, ... }:

{

  # ⚙️ NixVim Configuration
  programs.nixvim = {
    enable = true;
  };
  
  colorschemes.catppuccin.enable = true;
    
  plugins.lualine.enable = true;

}
