{ config, pkgs, ... }:
let 
  src = pkgs.fetchurl {
    url = "https://github.com/imputnet/helium-linux/releases/download/${version}/${pname}-${version}-x86_64.AppImage"; 
    hash = "sha256:362ec867d50169fafeb2cd017106912aa9a5989238215d6344027c8e17287658";
  };
in
   
