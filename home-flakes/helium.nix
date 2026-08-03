{ pkgs, ... }:
let
  pname = "helium";
  version = "0.15.1.1";

  src = pkgs.fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${version}/${pname}-${version}-x86_64.AppImage"; 
    hash = "sha256:ab3df0fa79ef0609291d3dc4df876fe03bc5b98972cd303283db4f609156b37a";
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
    exec = "helium %u";
    icon = iconPath;
    terminal = false;
    categories = ["Application"];
    type = "Application";
	mimeType = ["x-scheme-handler/http" "x-scheme-handler/https"];
  };
}
