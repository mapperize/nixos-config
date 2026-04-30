{ plasma-manager, configRoot, config, pkgs, ... }:

{
	imports = [ 
		./home-flakes/git.nix
		./home-flakes/bash.nix
		./home-flakes/plasma-config.nix
		./home-flakes/vim.nix
        ./home-flakes/helium.nix
        ./home-flakes/obs.nix
        ./home-flakes/mpv.nix

        ./home-flakes/konsole.nix

        ./home-flakes/doom-emacs.nix

        ./home-flakes/electronics/kicad.nix
        ./home-flakes/electronics/ltspice.nix

        ./home-flakes/programming/c-and-c++.nix
        ./home-flakes/programming/haskell.nix
        ./home-flakes/programming/misc.nix

        ./home-flakes/laptop/powertop.nix

		plasma-manager.homeModules.plasma-manager 
	];

	home.username = "joowon";
	home.homeDirectory = "/home/joowon";

	home.packages = with pkgs; [
	neofetch
	xz
	p7zip
	
	glow

	pciutils
	usbutils

	emacs

	];

    home.sessionPath = [
      "$HOME/.config/emacs/bin"
    ];

	home.stateVersion = "25.11";		
}
