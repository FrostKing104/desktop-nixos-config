{ config, pkgs, lib, ... }:
{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/anklus/Music/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
    # REMOVED: user = "anklus"; - Home Manager handles the user automatically.
  };

  # USE systemd.user.services to configure the user-level systemd unit
  systemd.user.services.mpd.environment = {
    # It's better to use lib.strings.toString config.users.users.anklus.uid 
    # if this were NixOS, but for Home Manager, just using the current user's UID 
    # is usually fine, or you can often omit this environment variable entirely
    # as Home Manager's systemd user service should set it correctly.
    # However, to explicitly match what you were trying to do:
    XDG_RUNTIME_DIR = "/run/user/1000"; 
  };
}
