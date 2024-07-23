# variables
user := env_var("USER")

# cleans and removes any unused packages from the nix store, it also removes all the past nixos generations
full-clean:
    sudo nix-collect-garbage -d
    sudo nix-store --optimise

# removes unnecessary nixos packages and also optimises the nixos store
clean:
	sudo nix-collect-garbage
	sudo nix-store --optimise

# rebuilds and switches to the new system configurations
rebuild:
	sudo nixos-rebuild switch --flake nixos/#greenix

# rebuilds and switches to the new home configuration
rebuild-home:
	home-manager switch --flake home-manager/#{{user}}

# builds the portable iso version of my system
build-iso:
	nix run nixpkgs#nixos-generators -- --format iso --flake nixos/#portable -o result

# checks the `dev-flake`
build-dev-flake:
	nix flake check ./dev-flake

# updates the flakes
update:
	nix flake update ./nixos
	nix flake update ./home-manager
	nix flake update ./dev-flake
