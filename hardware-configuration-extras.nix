{ pkgs, ... }:

{
	hardware = {
		pulseaudio.enable = true;
		bluetooth.enable = false;
		opengl = {
			driSupport = true;
			driSupport32Bit = true;
			extraPackages = with pkgs; [ vaapiIntel libvdpau-va-gl vaapiVdpau ];
		};
		cpu.intel.updateMicrocode = true;
	};

	powerManagement = {
		enable = true;
	};
}
