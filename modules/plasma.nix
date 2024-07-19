{ pkgs, ... }:

{
  services = {
    displayManager.sddm.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "us";
      desktopManager.plasma5.enable = true;
    };
  };

  programs.kdeconnect.enable = true;
}
