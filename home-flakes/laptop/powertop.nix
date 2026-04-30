{ options, pkgs, ...}:
{
  home.packages = with pkgs; [
    powertop
  ];

}
