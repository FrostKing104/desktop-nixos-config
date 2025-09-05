{ pkgs, lib, ... }:

{
  programs.neovim.enable = true;
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        theme = {
          enable = true;
          name = "catppuccin";
	  style = "latte";
        };
        statusline.lualine.enable = true;
        # Fuzzy Finder
        telescope.enable = true;
	autocomplete.nvim-cmp.enable = true;
        # Language Support
        lsp.enable = true;
        languages = {
          enableTreesitter = true;
          nix.enable = true;
          python.enable = true;
          html.enable = true;
          css.enable = true;
          bash.enable = true;
        };
      };
    };
  };
}
