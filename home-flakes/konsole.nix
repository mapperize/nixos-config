{ configRoot, config, pkgs, ... }:
{
  home.file.".config/konsolerc" = {
    source = "${configRoot}/configs/konsole/konsolerc";
    force = true; 
  };
  home.file.".local/share/konsole/main.profile" = {
    source = "${configRoot}/configs/konsole/main.profile";
    force = true; 
  };
}
