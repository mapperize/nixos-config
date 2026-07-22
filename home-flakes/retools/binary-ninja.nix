{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    binaryninja-free 
  ];
}
