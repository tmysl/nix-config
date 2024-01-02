{ lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    theme = "Solarized Dark - Patched";
    package = lib.mkIf pkgs.stdenv.isDarwin (pkgs.writeShellScriptBin "kitty" ''
        #!/usr/bin/env sh

        ${pkgs.nixgl.nixGLIntel}/bin/nixGLIntel ${pkgs.kitty}/bin/kitty "$@"
    '');
  };
}
