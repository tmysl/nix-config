{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
    logseq
  ];

  home.file = {
    ".inputrc".source = ../../dotfiles/inputrc;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  imports = [
    ./kitty.nix
    ./neovim.nix
    ./tmux.nix
    ./zsh.nix
  ];
}
