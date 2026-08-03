{ config, pkgs, ...}:

{
	environment.systemPackages = with pkgs; [
	  wineWowPackages.
	  winetricks
	  wine-gecko wine-mono
	];
}
