{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    (lib.hiPrio gcc)
    (lib.lowPrio clang)
    lld
    llvm
    ninja
    gnumake

    # graphics libs
    gtk3
    imgui
    raylib
    sdl3
    sdl3.dev
    sdl2-compat
    sdl2-compat.dev
  ];
}
