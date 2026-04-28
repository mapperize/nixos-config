{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    (lib.hiPrio gcc)
    (lib.lowPrio clang)
    lld
    llvm
    ninja

    # graphics libs
    gtk3
    imgui
    raylib
  ];
}
