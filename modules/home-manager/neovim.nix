{ config, pkgs, ... }:

let
  vimrcSrc = builtins.readFile ../../dotfiles/vimrc;

  vimPlugins = with pkgs.vimPlugins; [
    auto-pairs
    vim-abolish
    vim-colors-solarized
    vim-sleuth
    vim-slime
    vim-speeddating
    vim-surround
    vim-tmux-navigator
    vim-unimpaired
  ];

  vimSyntaxPlugins = with pkgs.vimPlugins; [
    csv-vim
    vim-elixir
    vim-javascript
    vim-json
    vim-nix
    vim-ruby
    vim-terraform
    vim-yaml
    vimtex
  ];

  toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
in
  {
    # Keep vim lighter than neovim
    programs.vim = {
      enable = true;
      defaultEditor = true;
      extraConfig = vimrcSrc;
      plugins = vimPlugins ++ vimSyntaxPlugins;
    };

    programs.neovim = {
      enable = true;
      extraConfig = vimrcSrc;

      extraPackages = with pkgs; [
        cargo
        rust-analyzer
      ];

      plugins = with pkgs.vimPlugins; [
        markdown-preview-nvim
        {
          plugin = (nvim-treesitter.withPlugins (p: [
            p.csv
            p.elixir
            p.erlang
            p.heex
            p.javascript
            p.json
            p.latex
            p.lua
            p.markdown
            p.nix
            p.ruby
            p.rust
            p.terraform
            p.toml
            p.yaml
          ]));
          config = toLuaFile ../../dotfiles/nvim/plugins/treesitter.lua;
        }
        {
          plugin = nvim-lspconfig;
          config = toLuaFile ../../dotfiles/nvim/plugins/lspconfig.lua;
        }
        nvim-cmp
        cmp-nvim-lsp
        cmp_luasnip
        luasnip
        friendly-snippets
      ] ++ vimPlugins;
    };
  }
