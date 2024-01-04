{ pkgs, ... }:

{
  # TODO this should only need to be installed for a single user, but this
  # module shouldn't know the username
  environment.systemPackages = with pkgs; [ logseq ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];
}
