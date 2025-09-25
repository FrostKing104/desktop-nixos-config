# webApps.nix
# This file defines all of your browser-based web applications.

# 1. Add `config` to the arguments here
{ pkgs, config, ... }:

{
  home.packages = [
    pkgs.chromium
    pkgs.papirus-icon-theme
  ];

  xdg.desktopEntries = {
    "youtube-music" = {
      name = "YouTube Music";
      # 2. Use the Nix variable for the absolute home path
      exec = "${pkgs.chromium}/bin/chromium --app=https://music.youtube.com --user-data-dir=${config.home.homeDirectory}/.config/chromium-web-apps/youtube-music";
      icon = "youtube-music";
      comment = "YouTube Music streaming service";
      terminal = false;
      type = "Application";
      categories = [ "AudioVideo" "Audio" "Network" ];
    };
  };
}
