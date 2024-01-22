{ pkgs, ... }:

{
  # Enable CUPS
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.brlaser ];
}
