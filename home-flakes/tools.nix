{ options, pkgs, ...}:
{
  home.packages = with pkgs; [
    powertop
	vulkan-tools
	dmidecode
	clinfo
	libva-utils
	#geekbench
	renderdoc
	filezilla
	termius
	signal-desktop
	llama-cpp
  ];

}
