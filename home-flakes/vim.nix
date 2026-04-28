{ config, pkgs, ...}:
{
programs.vim = {
  enable = true;
  plugins = [ pkgs.vimPlugins.vim-nix ];
  settings = { tabstop = 2; };
  extraConfig = ''
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
  '';
};
}
