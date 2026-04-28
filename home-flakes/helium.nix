{ pkgs, ... }:
let
  pname = "helium";
  version = "0.11.5.1";

  src = pkgs.fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${version}/${pname}-${version}-x86_64.AppImage"; 
    hash = "sha256:362ec867d50169fafeb2cd017106912aa9a5989238215d6344027c8e17287658";
  };
  helium-pkg = pkgs.appimageTools.wrapType2 {
    inherit pname version src;
    extraPkgs = pkgs: [ pkgs.libva ];
  };
  iconPath = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/imputnet/helium/refs/heads/main/resources/branding/app_icon/raw.png";
    sha256 = "sha256:757f00b34f506cc7419437f62951dad7419e7270ae99658f7b554ba3a39f9edd";
  };
in {
  home.packages = [ helium-pkg ];
  xdg.desktopEntries.helium = {
    name = "Helium";
    exec = "helium";
    icon = iconPath;
    terminal = false;
    categories = ["Application"];
    type = "Application";
  };
}
