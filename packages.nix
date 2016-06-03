
{ pkgs, ... }:

{
	environment.systemPackages = with pkgs ; [
		
		# stuff i really need
		vim
		mksh

		# wm stuff
		termite
		i3lock
		cwm
		dzen2

		# apps
		htop
		zathura
		feh
		mpv
		compton
		imagemagick
		jmtpfs
		unzip
		chromium
		arandr
		pavucontrol
		plan9port
		ranger

		# dev stuff
		git
		qemu
		vde2
		sublime3

		#android stuff
		androidsdk
		androidndk
		idea.android-studio
		android-udev-rules
	];

	nixpkgs.config = {
		allowBroken = true;
		allowUnfree = true;
	};
}
