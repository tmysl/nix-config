{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/core-pkgs.nix
      ../../modules/enable-flakes.nix
      ../../modules/dropbox.nix
      ../../modules/gpg.nix
      ../../modules/locale.nix
      ../../modules/logseq.nix
      ../../modules/plasma.nix
      ../../modules/printing.nix
      ../../modules/sound.nix
    ];

  boot = {
    initrd.luks.devices."luks-d46fbf02-4061-46b6-a3d1-87462667bf4d".device = "/dev/disk/by-uuid/d46fbf02-4061-46b6-a3d1-87462667bf4d";

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "johto";
    networkmanager.enable = true;
  };

  users.users.bgottlob = {
    isNormalUser = true;
    description = "Brandon Gottlob";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

  home-manager.users.bgottlob = {
    imports = [
      ../../modules/home.nix
      ../../modules/home-manager/workstation.nix
    ];
  };

  services.pcscd.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
