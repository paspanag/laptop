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

}
