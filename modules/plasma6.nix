# Set up Plasma 6 on Wayland
{ pkgs, ... }:

{
  services = {
    desktopManager.plasma6.enable = true;
    displayManager = {
      # Set default session to Plasma on Wayland
      defaultSession = "plasma";
      sddm.enable = true;
    };

    # sddm doesn't properly launch Plasma when it runs on Wayland, so an X
    # server is still required for sddm to function properly; at some point in
    # the future, this may change
    xserver.enable = true;
  };

  programs.kdeconnect.enable = true;
}
