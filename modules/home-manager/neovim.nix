{ config, pkgs, ... }:

let
  vimrcSrc = builtins.readFile ../../dotfiles/vimrc;

  vimPlugins = with pkgs.vimPlugins; [
    auto-pairs
    csv-vim
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
in
  {
    # Keep vim lighter than neovim
    programs.vim = {
      enable = true;
      defaultEditor = true;
      extraConfig = vimrcSrc;
      plugins = vimPlugins;
    };

    programs.neovim = {
      enable = true;
      extraConfig = vimrcSrc;
      plugins = with pkgs.vimPlugins; [
        markdown-preview-nvim
      ] ++ vimPlugins;
    };
  }
