{ config, pkgs, ... }:
{
	home.packages = with pkgs; [
		mpv
		obs-studio

		# required for yt-dlp + ejs
		deno

		krita
		davinci-resolve
	];
}

