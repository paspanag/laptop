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
