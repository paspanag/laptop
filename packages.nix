
{ pkgs, ... }:

with pkgs.lib;

{
    environment.systemPackages = with pkgs ; [
	vim
	mksh
	termite
	i3lock
	cwm
	dzen2
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
	cowsay
	ranger
	git
	qemu
	vde2
    ];

    nixpkgs.config = {
        allowBroken = true;
        allowUnfree = true;
    };
}
