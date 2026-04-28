{ config, pkgs, ... }:

{ 

  programs.git = {
    enable = true;
    settings.user  = {
      name = "Joowon";
      email = "120153524+mapperize@users.noreply.github.com";
    };
  };

}
