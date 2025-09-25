# webApps.nix

{ pkgs, ... }:

{
  home.packages = [
    pkgs.chromium
    pkgs.papirus-icon-theme
  ];

  xdg.desktopEntries = {
    "youtube-music" = {
      name = "YouTube Music";
      # Corrected: The entire command must be on a single line.
      exec = "${pkgs.chromium}/bin/chromium --app=https://music.youtube.com --user-data-dir=%h/.config/chromium-web-apps/youtube-music";
      icon = "youtube-music";
      comment = "YouTube Music streaming service";
      terminal = false;
      type = "Application";
      categories = [ "AudioVideo" "Audio" "Network" ];
    };
  };
}
