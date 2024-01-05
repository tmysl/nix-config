{ pkgs, ... }:

{
  home.packages = with pkgs; [ bat ];

  home.file = {
    ".inputrc".source = ../../dotfiles/inputrc;
  };

  imports = [
    ./kitty.nix
    ./vim.nix
    ./tmux.nix
    ./zsh.nix
  ];
}
