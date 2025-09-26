{ pkgs, lib, ... }:

{
  # This line is all you need from the base neovim program
  programs.neovim.enable = true;

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        # ... other settings like theme, lualine, etc.

        # 👇 Add your custom config here, inside the vim block
        extraConfig = ''
          " Set 2-space indentation for Nix files
          autocmd FileType nix setlocal shiftwidth=2 softtabstop=2 expandtab
        '';

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

        # ... rest of your settings
      };
    };
  };
}
