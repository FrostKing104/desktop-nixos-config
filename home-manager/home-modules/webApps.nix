# webApps.nix
# This file defines all of your browser-based web applications.

{ pkgs, ... }:

{
  # It's good practice to define the required packages here with the config
  home.packages = [
    pkgs.chromium
    pkgs.papirus-icon-theme
  ];

  # Define all your web app desktop entries in this set
  xdg.desktopEntries = {
    "youtube-music" = {
      name = "YouTube Music";
      exec = "${pkgs.chromium}/bin/chromium --app=https://music.youtube.com";
      icon = "youtube-music";
      comment = "YouTube Music streaming service";
      terminal = false;
      type = "Application";
      categories = [ "AudioVideo" "Audio" "Network" ];
    };

    "google-calendar" = {
      name = "Google Calendar";
      exec = "${pkgs.chromium}/bin/chromium --app=https://calendar.google.com";
      icon = "google-calendar";
      comment = "Google Calendar web app";
      terminal = false;
      type = "Application";
      categories = [ "Office" "Network" ];
    };

    # You can easily add more web apps here in the future!
  };
}
