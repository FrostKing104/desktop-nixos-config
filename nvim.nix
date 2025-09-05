{ pkgs, lib, ... }:

{
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          name = "catppuccin";
        }; # A semicolon was needed here to close the 'theme' attribute set.
        style = "dark"; # The 'style' attribute was incorrectly nested. It should be a direct child of the 'vim' attribute set.
        statusline.lualine.enable = true;
      }; # A semicolon was needed here to close the 'vim' attribute set.

      # Fuzzy Finder
      telescope.enable = true;
      # 'Fancy' Completion Menu
      autocomplete.nvim-cmp.enable = true;

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
      }; # A semicolon was needed here to close the 'languages' attribute set.
    };
  };
}
