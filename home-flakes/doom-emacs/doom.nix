{ doom-emacs, config, pkgs, lib, ...}:

{


home.file.".config/doom/init.el".source = ./init.el;
home.file.".config/doom/config.el".source = ./config.el;
home.file.".config/doom/packages.el".source = ./packages.el;

home.activation.postDoomEmacs = lib.hm.dag.entryAfter ["writeBoundary"] ''
    cd "$HOME"

    PATH="$HOME/.emacs.d/bin:$PATH"
    PATH="${pkgs.emacs}/bin:$PATH"
    PATH="${pkgs.git}/bin:$PATH"

    if [ ! -f "$HOME/.emacs.d/bin/doom" ]; then 
      rm -rf "$HOME/.emacs.d"
      ${pkgs.git}/bin/git clone --depth 1 https://github.com/doomemacs/doomemacs "$HOME/.emacs.d"
      emacs --batch -f nerd-icons-install-fonts
    fi

    doom sync
    doom env
  '';
}
