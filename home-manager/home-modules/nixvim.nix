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

  plugins.lualine.enable = true;
  
  };
}
