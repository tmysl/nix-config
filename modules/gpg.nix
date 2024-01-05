{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ gnupg ];

  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "curses";
    enableSSHSupport = true;
  };
}
