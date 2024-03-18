{ lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ gnupg ];

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = lib.mkForce pkgs.pinentry-curses;
    enableSSHSupport = true;
  };
}
