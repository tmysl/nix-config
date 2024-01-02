{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    enableVteIntegration = true;
    defaultKeymap = "viins";
    initExtra = builtins.readFile ../../dotfiles/zshrc;
    shellAliases = {
      vim = "nvim";
    };
  };

  home.file.".p10k.zsh".source = ../../dotfiles/p10k.zsh;
}
