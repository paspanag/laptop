{ pkgs, ... }:

{
	boot.loader.grub = {
		enable = true;
		version = 2;
		device = "/dev/sda";
	};

	boot.kernelPackages = pkgs.linuxPackages_4_5;

	boot.kernelParams = [
		"elevator=noop"
		"ipv6.disable=1"
	];
}
