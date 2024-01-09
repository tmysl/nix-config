# Development and productivity tools for getting work done
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    keepassxc
    libreoffice-qt
    jq
    yq
  ];

  home.file = {
    ".inputrc".source = ../../dotfiles/inputrc;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  imports = [
    ./k8s.nix
    ./kitty.nix
    ./tmux.nix
    ./vim.nix
    ./zsh.nix
  ];
}
