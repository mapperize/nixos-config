{ config, pkgs, lib, ... }:

{
home.activation.installLtspice = lib.hm.dag.entryAfter ["writeBoundary"] ''
  unset DISPLAY
  unset WAYLAND_DISPLAY
  export WINEARCH=win64
  export WINEPREFIX="$HOME/.local/share/ltspice/wineprefix"
  MSI="${pkgs.fetchurl {
    url = "https://github.com/mapperize/nixos-config/releases/download/installers/LTspice64.msi";
    hash = "sha256:ec35026697ed32d2ae57b17be3a3c8877b631f642b66326491a9808c47ec0081";
  }}"

  if [ ! -f "$WINEPREFIX/drive_c/Program Files/ADI/LTspice/LTspice.exe" ]; then
    mkdir -p "$WINEPREFIX"
    ${pkgs.wineWow64Packages.waylandFull}/bin/wineboot --init
    ${pkgs.wineWow64Packages.waylandFull}/bin/wineserver --wait
    ${pkgs.wineWow64Packages.waylandFull}/bin/wine msiexec /i "$MSI" /quiet ALLUSERS=1
    ${pkgs.wineWow64Packages.waylandFull}/bin/wineserver --wait
  fi
'';
}
