{ plasma-manager, configRoot, config, pkgs, ... }:

{
	imports = [ 
	./home-flakes/git.nix
	./home-flakes/bash.nix
	./home-flakes/plasma-config.nix
	./home-flakes/helium.nix

	./home-flakes/video_photo.nix
	./home-flakes/games.nix

	./home-flakes/konsole.nix

	./home-flakes/doom-emacs.nix

	./home-flakes/electronics/kicad.nix
	./home-flakes/electronics/ltspice.nix

	./home-flakes/programming/c-and-c++.nix
	./home-flakes/programming/haskell.nix
	./home-flakes/programming/misc.nix

	./home-flakes/retools/binary-ninja.nix

	./home-flakes/laptop/powertop.nix

	plasma-manager.homeModules.plasma-manager 

	];

	home.username = "joowon";
	home.homeDirectory = "/home/joowon";

	home.packages = with pkgs; [
	fastfetch
	xz
	p7zip
	
	glow

	pciutils
	usbutils

	emacs

	kdePackages.kdeconnect-kde
	librepods

	];

    home.sessionPath = [
      "$HOME/.config/emacs/bin"

	programs.bash.enable = true;
	programs.zsh.enable = true;
	programs.fish.enable = true;

    home.sessionPath = [
		"$HOME/.config/emacs/bin"
		"$HOME/.emacs.d/bin"
    ];

	home.stateVersion = "26.05";		

}
