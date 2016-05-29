{ ... }:

{
    hardware = {
        #enableAllFirmware = true;
        opengl.driSupport = true;
        pulseaudio.enable = true;
        bluetooth.enable = false;
	opengl.driSupport32Bit = true;
    };

    powerManagement = {
        enable = true;
    };
}
