	{
    description = "NixOS Flakes Config";
    
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
	home-manager = {
		url = "github:nix-community/home-manager/release-25.11";
		inputs.nixpkgs.follows = "nixpkgs";
	};
	plasma-manager = {
		url = "github:nix-community/plasma-manager";
		inputs.nixpkgs.follows = "nixpkgs";
		inputs.home-manager.follows = "home-manager";
	};
    };	

    outputs = { self, nixpkgs, home-manager, plasma-manager, ...}@inputs: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            modules = [
                ./configuration.nix
		./hardware-configuration.nix
		home-manager.nixosModules.home-manager
		{
			home-manager.useGlobalPkgs = true;
			home-manager.useUserPackages = true;

			home-manager.extraSpecialArgs = {
				inherit plasma-manager;
			};

			home-manager.users.joowon = import ./home.nix;
		}
            ];
        };
    };
}
