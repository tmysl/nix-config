{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/bluetooth.nix
      ../../modules/core-pkgs.nix
      ../../modules/enable-flakes.nix
      ../../modules/dropbox.nix
      ../../modules/gaming.nix
      ../../modules/gpg.nix
      ../../modules/locale.nix
      ../../modules/plasma6.nix
      ../../modules/printing.nix
      ../../modules/sound.nix
    ];

  boot = {
    initrd.luks.devices."luks-d46fbf02-4061-46b6-a3d1-87462667bf4d".device = "/dev/disk/by-uuid/d46fbf02-4061-46b6-a3d1-87462667bf4d";

    kernelParams = [
      # Fix for brightness buttons on 12th gen Intel Framework laptop
      # Ref: https://dov.dev/blog/nixos-on-the-framework-12th-gen
      "module_blacklist=hid_sensor_hub"
    ];

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
    extraGroups = [ "docker" "networkmanager" "wheel" "scanner" "lp" ];
    shell = pkgs.zsh;
  };
  programs.zsh.enable = true;

  home-manager.users.bgottlob = {
    imports = [
      ../../modules/home.nix
      ../../modules/home-manager/workstation.nix
      ../../modules/home-manager/productivity.nix
    ];
  };

  services.pcscd.enable = true;

  virtualisation.docker.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  hardware = {
    sane = {
      enable = true;
      brscan4 = {
        enable = true;
      };
    };
  };
  # For scanner
  nixpkgs.config.allowUnfree = true;

  # Electron 27 is needed to build logseq until this issue is fixed:
  # https://github.com/NixOS/nixpkgs/issues/341683
  nixpkgs.overlays = [(
    final: prev: {
      logseq = prev.logseq.override {
        electron = prev.electron_27;
      };
    }
  )];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-27.3.11"
  ];
}
