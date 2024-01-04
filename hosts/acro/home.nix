{ pkgs, ... }:

{
  home.username = "brandon.gottlob";
  home.homeDirectory = "/Users/brandon.gottlob";

  # This should be the same value as `system.stateVersion` in `configuration.nix`
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
