{ config, pkgs, ...}:

{
	home.packages = with pkgs; [
		(python314.withPackages (ps: [
			ps.toml
			ps.yt-dlp
			ps.yt-dlp-ejs
			ps.feedparser
			ps.discordpy
		]))
	];
}
