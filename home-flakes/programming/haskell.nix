{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    cabal-install
    (haskellPackages.ghcWithPackages (ps: with ps; [
      aeson
      filepath
    ]))
  ];
}
