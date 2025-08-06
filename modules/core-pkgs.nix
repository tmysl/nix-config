# Packages that should be installed for all users that are required to have a
# useful system, plus utilities that I expect to have on all systems
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    chromium
    firefox
    flatpak
    git
    gparted
    parted
    tmux
    vim
    wget
  ];
}
