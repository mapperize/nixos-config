{ plasma-manager, config, pkgs, ... }:

{
	imports = [ 
		./home-flakes/git.nix
		./home-flakes/bash.nix
		./home-flakes/plasma-config.nix
		./home-flakes/vim.nix
        ./home-flakes/helium.nix
        ./home-flakes/doom-emacs/doom.nix

        ./home-flakes/electronics/kicad.nix
        #./home-flakes/electronics/ltspice.nix

        ./home-flakes/programming/c-and-c++.nix
        ./home-flakes/programming/haskell.nix
        ./home-flakes/programming/misc.nix

		plasma-manager.homeModules.plasma-manager 
	];

	home.username = "joowon";
	home.homeDirectory = "/home/joowon";

	home.packages = with pkgs; [
	neofetch
	xz
	p7zip
    gzip
	
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
