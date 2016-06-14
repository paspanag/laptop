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


		postgresql = {
			enable = false;
			authentication = "local all all ident";
		};
	};

	systemd.user.services.compton = {
		wantedBy = [ "default.target" ];
		serviceConfig = {
			ExecStart = ''${pkgs.compton}/bin/compton -f -C -D 5 --backend glx'';
			RestartSec = 3;
			Restart = "always";
		};
	};
}
