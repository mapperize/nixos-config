{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    (lib.hiPrio gcc)
    (lib.lowPrio clang)
    lld
    llvm
    ninja
    gnumake
	cmake
	pkg-config

	# other libs
	linuxHeaders
	stdenv.cc.cc.lib # for libstdc++.so.6

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
