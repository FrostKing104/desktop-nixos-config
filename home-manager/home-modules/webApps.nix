# webApps.nix
# This file defines all of your browser-based web applications.
{ pkgs, ... }:
{
  # define the required packages
  home.packages = [
    pkgs.chromium
    pkgs.papirus-icon-theme
  ];
  # Define all your web app desktop entries in this set
  xdg.desktopEntries = {
    "youtube-music" = {
      name = "YouTube Music";
      exec = "${pkgs.chromium}/bin/chromium --app=https://music.youtube.com --user-data-dir=$HOME/.config/chromium-youtube-music";
      icon = "youtube-music";
      comment = "YouTube Music streaming service";
      terminal = false;
      type = "Application";
      categories = [ "AudioVideo" "Network" ];
    };
  };
}
