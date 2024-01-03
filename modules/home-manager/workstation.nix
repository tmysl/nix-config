{ pkgs, ... }:

let
  x86_64Packages = if pkgs.system == "x86_64-linux" then [ pkgs.logseq ] else [];
in
{
  home.packages = with pkgs; [ bat ] ++ x86_64Packages;

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
