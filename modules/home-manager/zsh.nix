{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    enableVteIntegration = true;
    defaultKeymap = "viins";
    initExtra = ''
      [[ ! -f ${../../dotfiles/p10k.zsh} ]] || source ${../../dotfiles/p10k.zsh}
    '';
    shellAliases = {
      vim = "nvim";
    };
    plugins = with pkgs; [
      {
        name = "powerlevel10k";
        src = zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "autocomplete";
        src = zsh-autocomplete;
      }
    ];
  };
}
