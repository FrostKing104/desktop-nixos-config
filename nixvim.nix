{ config, pkgs, inputs, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    # FIX #1: The 'flavour' setting is now inside a 'settings' block.
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
      };
    };

    opts = {
      number = true;
      relativenumber = true;
    };

    plugins = {
      lualine.enable = true;
      gitsigns.enable = true;

      # FIX #2: Add the Language Server Protocol (LSP) plugin
      # and configure the Docker language server with the correct package.
      lsp = {
        enable = true;
        servers.dockerls = {
          enable = true;
          package = pkgs.dockerfile-language-server-nodejs; # This is the correct package name
        };
      };
    };
  };
}
