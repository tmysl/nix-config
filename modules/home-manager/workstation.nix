# Development and productivity tools for getting work done
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    keepassxc
    libreoffice-qt
  ];

  home.file = {
    ".inputrc".source = ../../dotfiles/inputrc;
  };

  programs.direnv.enable = true;

  imports = [
    ./kitty.nix
    ./vim.nix
    ./tmux.nix
    ./zsh.nix
  ];
}
