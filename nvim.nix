{ pkgs, lib, ... }:

{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          name = "catppuccin";
        };
        style = "dark";
        statusline.lualine.enable = true;
      };
      # Fuzzy Finder
      telescope.enable = true;
      # Language Support
      languages = {
        enableLSP = true;
        enableTreesitter = true;
        nix.enable = true;
        python.enable = true;
        html.enable = true;
        css.enable = true;
        bash.enable = true;
        shell.enable = true;
      };
    };
    # The 'autocomplete' option must be under 'plugins'
    plugins = {
      autocomplete = {
        nvim-cmp = {
          enable = true;
        };
      };
    };
  };
}
