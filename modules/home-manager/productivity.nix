{ pkgs, ... }:

{
  home.packages = with pkgs; [
    slack
    zoom-us
    ghostty
    _1password-gui 
    silver-searcher
    #libreoffice-qt
    #logseq
  ];
}

