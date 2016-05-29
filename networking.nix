{ ... }:

{
    networking = {
	hostName = "nixie"; # Define your hostname.
	wireless = {
		enable = true;
		networks = {
			panaguiton5g = {
				psk = "panaguiton";
			};
		};
	};
    };
}
