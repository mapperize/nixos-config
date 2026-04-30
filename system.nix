{ plasma-manager, config, pkgs, ... }:
 
{
  imports = [ 
    ./system-flakes/configuration.nix
    ./system-flakes/hardware-configuration.nix
    ./system-flakes/laptop.nix
    ./system-flakes/wine.nix
  ];
}
