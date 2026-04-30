{ pkgs, ... }:
let
  pname = "helium";
  version = "0.11.7.1";

  src = pkgs.fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${version}/${pname}-${version}-x86_64.AppImage"; 
    hash = "sha256:ab3735df920fe45d9bb71b4e31418ccfed1acc98582fd288d2570f1b62a37315";
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
