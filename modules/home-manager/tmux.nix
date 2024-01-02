{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = false;
    customPaneNavigationAndResize = true;
    keyMode = "vi";
    terminal = "screen-256color";
    shell = "${pkgs.zsh}/bin/zsh";
  };
}
