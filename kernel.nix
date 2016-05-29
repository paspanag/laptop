{ pkgs, ... }:

with pkgs.lib;

{
	boot.loader.grub = {
		enable = true;
		version = 2;
		efiSupport = true;
		device = "nodev";
	};

	boot.kernelPackages = pkgs.linuxPackages_4_5;

	boot.kernelParams = [
		"elevator=noop"
		"ipv6.disable=1"
	];
}
