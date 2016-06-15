{ pkgs, config, ... }:
let
	envVars = ''
		# GTK2
		export GTK_PATH=$GTK_PATH:${pkgs.gtk-engine-murrine}/lib/gtk-2.0
		export GTK2_RC_FILES=${pkgs.writeText "iconrc" ''gtk-icon-theme-name="Numix"''}:${pkgs.numix-gtk-theme}/share/themes/Numix/gtk-2.0/gtkrc:$GTK2_RC_FILES
		# GTK3
		export GTK_THEME="Numix"
		export GTK_DATA_PREFIX=${config.system.path}
	'';
in {
	services.xserver = {
		enable = true;
		autorun = true;
		videoDrivers = ["intel"];
		layout = "us";
		resolutions = [{x=1366; y=768;}];
		deviceSection = ''
			Option "RenderAccel" "true"
		'';
		defaultDepth = 24;
		displayManager = {
			lightdm.enable = true;
		};
		windowManager.session = [
			# cwm
			{
				name = "cwm";
				start = ''
					${envVars}
					${pkgs.feh}/bin/feh --randomize --bg-fill $HOME/photos/wallpapers
					${pkgs.cwm}/bin/cwm > /dev/null 2>&1 &
					waitPID=$!
				'';

			}
		];
		libinput = {
			enable = true;
			naturalScrolling = true;
		};
	};

	environment = {
		systemPackages = with pkgs; [
			numix-gtk-theme
			numix-icon-theme
			gtk-engine-murrine
			hicolor_icon_theme
		];

		pathsToLink = [ "/share" ];
	};
}
