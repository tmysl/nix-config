{ pkgs, ... }:

{
  home.packages = with pkgs; [
    slack
    zoom
    ghostty
    _1password-gui 
    zoom-us
    silver-searcher
    #libreoffice-qt
    #logseq
  ];
}

