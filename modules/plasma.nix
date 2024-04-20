{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };

  programs.kdeconnect.enable = true;
}
