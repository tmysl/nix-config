{ pkgs, ... }:

{
  home.username = "bgottlob";
  home.homeDirectory = "/home/bgottlob";

  # This should be the same value as `system.stateVersion` in `configuration.nix`
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
