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
    skins = {
      solarized_dark = ./solarized_dark_k9s.yaml;
    };
    settings = {
      k9s =  {
        ui = {
          skin = "solarized_dark";
        };
      };
    };
  };
}
