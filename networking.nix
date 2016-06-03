{ ... }:

{
	networking = {
		hostName = "nixie";
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
