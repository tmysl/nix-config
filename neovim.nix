{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraConfig = builtins.readFile dotfiles/vimrc;
    plugins = with pkgs.vimPlugins; [
      auto-pairs
      csv-vim
      vim-abolish
      vim-colors-solarized
      vim-elixir
      vim-erlang-runtime
      vim-javascript
      vim-json
      vim-markdown
      vim-nix
      vim-ruby
      vim-sleuth
      vim-slime
      vim-speeddating
      vim-surround
      vim-terraform
      vim-tmux-navigator
      vim-unimpaired
      vim-yaml
      vimtex
    ];
  };
}
