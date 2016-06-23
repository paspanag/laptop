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

}
