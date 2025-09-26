{ config, pkgs, lib, ... }:
{
 
  services.mpd = {
    enable = true;
    musicDirectory = "/path/to/music";
    extraConfig = ''
      audio_output {
        type "pulse"
        name "My PulseAudio" # this can be whatever you want
      }
    '';
  
    # Optional:
    #network.listenAddress = "any"; # if you want to allow non-localhost connections
    #network.startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
  };

}
