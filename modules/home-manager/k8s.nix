{ pkgs, ... }:

{
  home.packages = with pkgs; [
    istioctl
    kind
    kubectl
    kubectx
  ];

  programs.k9s = {
    enable = true;
    skin = "solarized-dark";
  };
}
