{ pkgs, ... }:

{
	services = {
		redshift = {
			enable = true;
			latitude = "51";
			longitude = "-114";
		};

		transmission = {
			enable = true;
		};

		xserver = {
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
						/run/current-system/sw/bin/cwm > /dev/null 2>&1 &
						waitPID=$!
					'';

				}
			];
			libinput = {
				enable = true;
			};
		};
	};

	systemd.user.services.compton = {
		wantedBy = [ "default.target" ];
		serviceConfig = {
			ExecStart = ''${pkgs.compton}/bin/compton -f -C -D 5 --backend glx --inactive-dim 0.35'';
			RestartSec = 3;
			Restart = "always";
		};
	};
}
