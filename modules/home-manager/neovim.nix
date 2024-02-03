{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraConfig = builtins.readFile ../../dotfiles/vimrc;
    plugins = with pkgs.vimPlugins; [
      auto-pairs
      csv-vim
      markdown-preview-nvim
      vim-abolish
      vim-colors-solarized
      vim-elixir
      vim-erlang-runtime
      vim-javascript
      vim-json
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
