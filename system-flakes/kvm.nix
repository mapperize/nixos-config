{ config, pkgs, ... }:
{
	virtualisation.libvirtd = {
		enable = true;
		qemu = {
			package = pkgs.qemu_kvm;
			runAsRoot = true;
			swtpm.enable = true;
	  	};
	};
	virtualisation.spiceUSBRedirection.enable = true;

	programs.virt-manager.enable = true;
	boot.kernelModules = ["kvm-intel"];

	users.groups.libvirtd.members = ["joowon"];

	users.users.joowon.extraGroups = [ "wheel" "docker" ];
	virtualisation.docker.enable = true;
}
