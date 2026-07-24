{ options, pkgs, ...}:
{
  home.packages = with pkgs; [
    powertop
	vulkan-tools
	dmidecode
	clinfo
	geekbench
	renderdoc
  ];

}
