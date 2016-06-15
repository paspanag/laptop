{ pkgs, config, fetchcurl, ... }:
let
	envVars = ''
		# GTK2
		export GTK_PATH=$GTK_PATH:${pkgs.gtk-engine-murrine}/lib/gtk-2.0
		export GTK2_RC_FILES=${pkgs.writeText "iconrc" ''gtk-icon-theme-name="Numix"''}:${pkgs.numix-gtk-theme}/share/themes/Numix/gtk-2.0/gtkrc:$GTK2_RC_FILES
		# GTK3
		export GTK_THEME="Numix"
		export GTK_DATA_PREFIX=${config.system.path}
	'';
	peteswallpapers = pkgs.stdenv.mkDerivation {
		name = "wallpaper-pack";
		src = pkgs.fetchFromGitHub {
			owner = "peppy";
			repo = "wallpapers";
			rev = "84b6e9ca679afd1ad20fc315788a87611d111351";
			sha256 = "1lnkrwhrzrf7bs2pm5b2q5p5q6f1i1zxqs002dnxq3wb0nlka76n";
		};
		buildCommand = ''
			# Copy base icons
			mkdir -p $out/share/wallpapers
			cp -R $src/Desktop/*.jpg $out/share/wallpapers	
		'';
	};
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
			peteswallpapers
		];

		pathsToLink = [ "/share" ];
	};

	systemd.user.services = {
		feh = {
			wantedBy = [ "default.target" ];
			serviceConfig = {
				Type = "oneshot";
				Environment = "DISPLAY=:0";
				ExecStart = ''${pkgs.bash}/bin/bash -c '${pkgs.feh}/bin/feh --randomize --bg-fill %h/photos/wallpapers'
				'';
			};
		};
		compton = {
			wantedBy = [ "default.target" ];
			serviceConfig = {
				ExecStart = ''${pkgs.compton}/bin/compton -f -C -D 5 --backend glx'';
				RestartSec = 3;
				Restart = "always";
			};
		};
	};
}
