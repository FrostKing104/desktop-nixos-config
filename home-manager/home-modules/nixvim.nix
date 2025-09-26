{ config, pkgs, ... }:

{
  # ⚙️ NixVim Configuration
  programs.nixvim = {
    enable = true; # <-- ADD a comma here, as it's followed by another attribute

    # ✅ CORRECT SCOPE: colorschemes is a sub-attribute of programs.nixvim
    colorschemes.catppuccin = {
      # The 'enable' flag for the colorscheme itself
      enable = true; 
      
      color_overrides = {
        mocha = {
          base = "#1e1e2f";
        };
      };
      disable_underline = true;
      flavour = "mocha";
      integrations = {
        cmp = true;
        gitsigns = true;
        mini = {
          enabled = true;
          indentscope_color = "";
        };
        notify = false;
        nvimtree = true;
        treesitter = true;
      };
      styles = {
        booleans = [
          "bold"
          "italic"
        ];
        conditionals = [
          "bold"
        ];
      };
      term_colors = true;
    }; # <--- NO comma needed here, as it's the second-to-last attribute
    
    # ✅ CORRECT SCOPE: plugins is also a sub-attribute of programs.nixvim
    plugins.lualine.enable = true;
    
  }; # <-- The programs.nixvim block correctly closes here
}
