# rebuilds and switches to the new system configurations
rebuild flags:
	sudo nixos-rebuild switch --flake nixos/#greenix {{flags}}

# builds the portable iso version of my system
build-iso:
	nix run nixpkgs#nixos-generators -- --format iso --flake nixos/#portable -o result

# checks the `dev-flake`
build-dev-flake:
	nix flake check ./dev-flake
