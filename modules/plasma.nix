{ ... }:

{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };
}
