{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    enableVteIntegration = true;
    defaultKeymap = "viins";
    initExtra = ''
      [[ ! -f ${../../dotfiles/p10k.zsh} ]] || source ${../../dotfiles/p10k.zsh}
      [[ ! -f "$HOME/.zshrc.system" ]] || source "$HOME/.zshrc.system"
    '';
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
