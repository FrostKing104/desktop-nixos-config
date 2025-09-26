{
  # ⚙️ NixVim Configuration
  programs.nixvim = {
    enable = true;

    # 1. colorschemes and its sub-options must be inside programs.nixvim
    colorschemes.catppuccin = {
      # Catppuccin requires 'enable = true;' to be a sibling of its settings.
      enable = true; 
      
      # The rest of your Catppuccin configuration
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
    };
    
    # 2. plugins and its sub-options must also be inside programs.nixvim
    plugins.lualine.enable = true;
  };
}
